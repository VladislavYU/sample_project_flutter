import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io' hide WebSocket;
import 'dart:math' show max;

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gql_dio_link/gql_dio_link.dart' hide HttpLinkHeaders;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:path/path.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:websocket/websocket.dart' show WebSocket;

// import '../models/uploaded_file.dart';
import 'controllers.dart';

class ApiController extends DisposableInterface {
  ApiController({
    @required this.graphqlEndpoint,
    @required this.graphqlWsEndpoint,
    @required this.apiBaseUrl,
    @required this.storageBaseUrl,
  });

  static ApiController get to => Get.find<ApiController>();

  final String graphqlEndpoint;
  final String graphqlWsEndpoint;
  final String apiBaseUrl;
  final String storageBaseUrl;

  static String getFileUrl(String path) =>
      <String>[to.storageBaseUrl, path].join('/');

  GraphQLClient _client;
  static GraphQLClient get client => to._client;

  static Future<QueryResult> Function(MutationOptions) get mutate =>
      client.mutate;
  static Future<QueryResult> Function(QueryOptions) get query => client.query;
  static Stream<QueryResult> Function(SubscriptionOptions) get subscribe =>
      client.subscribe;

  Dio _dio;
  static Dio get dio => to._dio;

  final token = Rx<AuthToken>(StoreController.to.token);
  String get accessToken => token.value?.accessToken;

  String get userId {
    if (accessToken == null) return null;
    final result = JwtDecoder.decode(accessToken);
    return result['https://hasura.io/jwt/claims']['x-hasura-user-id'];
  }

  static const _authTokenRefreshRoute = '/auth/token/refresh';
  static const _authRegisterRoute = '/auth/register';
  static const _authLoginRoute = '/auth/login';
  static const _authLogoutRoute = '/auth/logout';
  static const _authFirebaseRoute = '/auth/firebase';

  @override
  void onInit() {
    _dio = Dio(BaseOptions(baseUrl: apiBaseUrl))
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          if (accessToken != null) {
            if (JwtDecoder.isExpired(accessToken) &&
                options.path != _authTokenRefreshRoute) await refreshToken();

            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return options;
        },
        onError: (err) {
          if (err.error is SocketException) {
            log('connection error', name: 'ApiController', error: err.error);
          } else if (err.response != null) {
            switch (err.response.statusCode) {
              case 401:
                if (token != null) {
                  debugger();
                  FirebaseCrashlytics.instance.recordError(err, null);
                }
                break;

              default:
                break;
            }
          }
        },
      ));

    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) {
    //     return true;
    //   };
    // };

    final errorLink = ErrorLink(
      onGraphQLError: (request, forward, response) async* {
        if (response.errors != null) {
          log('graphql server error',
              name: 'ApiController', error: response.errors[0]);
        }

        yield* forward(request);
      },
      onException: (request, forward, exception) async* {
        if (exception != null) {
          log('graphql client exception',
              name: 'ApiController', error: exception);
        }

        yield* forward(request);
      },
    );

    WebSocket _socket;
    void sendHeaders() {
      final payload = json.encode({
        'type': 'connection_init',
        'payload': {'headers': _createHeaders()},
      });
      _socket?.add(payload);
      log('socket send new headers:\n$payload', name: 'ApiController');
    }

    final socketLink = WebSocketLink(
      graphqlWsEndpoint,
      config: SocketClientConfig(
        autoReconnect: true,
        initialPayload: () => {'headers': _createHeaders()},
        onConnectOrReconnect: (socket) {
          log('socket connented', name: 'ApiController');
          _socket = socket;
          Future.delayed(
            const Duration(seconds: 1),
            () => UserController.to.subscribe(),
          );
        },
      ),
    )..connectOrReconnect();

    final dioLink = DioLink(graphqlEndpoint, client: _dio);

    final link = Link.from([
      // DedupeLink(),
      errorLink,
    ]).split((request) => request.isSubscription, socketLink, dioLink);

    _client = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: StoreController.to.apiStore,
      ),
    );

    String lastToken;
    ever(token, (value) {
      AuthToken current = value;

      // send new token to socket
      if (lastToken != current?.accessToken) sendHeaders();
      lastToken = current?.accessToken;

      // save token
      StoreController.to.saveToken(current);

      if (current != null) {
        final expiresIn = max(900000, current.expiresIn ?? 0);
        Future.delayed(Duration(milliseconds: expiresIn - 120000))
            .then((value) {
          if (token.value != null) refreshToken();
        });
      }
    });

    if (token.value != null) refreshToken();

    super.onInit();
  }

  Future<void> refreshToken() async {
    assert(token.value != null);

    try {
      final result = await _dio.get(_authTokenRefreshRoute, queryParameters: {
        'refresh_token': token.value.refreshToken,
      });
      token.value = AuthToken(
        accessToken: result.data['jwt_token'],
        expiresIn: result.data['jwt_expires_in'],
        refreshToken: result.data['refresh_token'],
      );

      log('token refreshed', name: 'ApiController');
    } catch (error) {
      log(_authTokenRefreshRoute, name: 'ApiController', error: error);
    }
  }

  Future<void> register(String email, String password) {
    return _dio.post(_authRegisterRoute, data: {
      'email': email,
      'password': password,
    });
  }

  Future<void> login(String email, String password) async {
    final result = await _dio.post(_authLoginRoute, data: {
      'email': email,
      'password': password,
      'cookie': false,
    });
    token.value = AuthToken(
      accessToken: result.data['jwt_token'],
      expiresIn: result.data['jwt_expires_in'],
      refreshToken: result.data['refresh_token'],
    );
    await UserController.to.loadUser();
  }

  Future<void> logout() async {
    final isAuth = token.value != null;
    token.value = null;
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.signOut();
    }
    if (isAuth) await _dio.post(_authLogoutRoute);
  }

  Future<void> loginByFirebase() async {
    if (FirebaseAuth.instance.currentUser == null) return;

    final idToken = await FirebaseAuth.instance.currentUser.getIdToken();
    final result = await Dio(BaseOptions(
      baseUrl: apiBaseUrl,
      headers: {
        'Authorization': 'Bearer $idToken',
      },
    )).post(_authFirebaseRoute, data: {
      'cookie': false,
    });

    token.value = AuthToken(
      accessToken: result.data['jwt_token'],
      expiresIn: result.data['jwt_expires_in'],
      refreshToken: result.data['refresh_token'],
    );
  }

  // Future<UploadedFile> uploadFile(
  //   String fileFromPath, {
  //   String fileName,
  //   Map<String, dynamic> data = const <String, dynamic>{},
  //   Function(int, int) onSendProgress,
  //   Function(int, int) onReceiveProgress,
  // }) async {
  //   final file = await MultipartFile.fromFile(fileFromPath);
  //   data['file'] = file;
  //   fileName ??= basename(fileFromPath);
  //   final formData = FormData.fromMap(data);
  //   final result = await _dio.post(
  //     '/storage/o/users/$userId/$fileName',
  //     data: formData,
  //     onSendProgress: onSendProgress,
  //     onReceiveProgress: onReceiveProgress,
  //   );
  //   return UploadedFile.fromJson(result.data);
  // }

  // Future<void> deleteFile(String path) => _dio.delete('/storage/o/$path');

  Map<String, String> _createHeaders() => accessToken != null
      ? <String, String>{'Authorization': 'Bearer $accessToken'}
      : {};
}

class AuthToken {
  /// The access token string as issued by the authorization server.
  final String accessToken;

  /// The type of token this is, typically just the string “bearer”.
  final String tokenType;

  /// If the access token expires, the server should reply
  /// with the duration of time the access token is granted for.
  final int expiresIn;

  /// Token which applications can use to obtain another access token.
  final String refreshToken;

  /// Application scope granted as defined in https://oauth.net/2/scope
  final String scope;

  const AuthToken({
    @required this.accessToken,
    this.tokenType = 'bearer',
    this.expiresIn,
    this.refreshToken,
    this.scope,
  });

  @override
  String toString() => json.encode(({
        'accessToken': accessToken,
        'tokenType': tokenType,
        'refreshToken': refreshToken,
        'expiresIn': expiresIn,
        'scope': scope
      }));

  factory AuthToken.parse(String data) {
    final map = json.decode(data);
    return AuthToken(
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
      expiresIn: map['expiresIn'],
      tokenType: map['tokenType'],
    );
  }
}
