import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' show max;

import 'package:dio/dio.dart' hide Response;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gql_dio_link/gql_dio_link.dart' hide HttpLinkHeaders;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:websocket/websocket.dart' show WebSocket;

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

  late final String? graphqlEndpoint;
  late final String? graphqlWsEndpoint;
  late final String? apiBaseUrl;
  late final String? storageBaseUrl;

  final _recconectController = StreamController<String>.broadcast();
  Stream get reconnectedStream => _recconectController.stream;

  WebSocketChannel? socket;

  late WebSocketLink socketLink;

  bool isRefreshing = false;

  static String getFileUrl(String? path) {
    if (path == null) return '';
    if (path.toLowerCase().contains('http')) return path;
    return <String>[to.storageBaseUrl ?? '', (path)].join('/');
  }

  late GraphQLClient _client;
  static GraphQLClient get client => to._client;

  static Future<QueryResult> Function(MutationOptions) get mutate =>
      client.mutate;
  static Future<QueryResult> Function(QueryOptions) get query => client.query;
  static Stream<QueryResult> Function(SubscriptionOptions) get subscribe =>
      client.subscribe;

  late Dio _dio;
  static Dio get dio => to._dio;

  final token = Rxn<AuthToken>(StoreController.to.token);
  String? get accessToken => token.value?.accessToken;

  String? get userId {
    if (accessToken == null) return null;
    final result = JwtDecoder.decode(accessToken!);
    return result['https://hasura.io/jwt/claims']['x-hasura-user-id'];
  }

  static const _authTokenRefreshRoute = '/auth/token/refresh';
  static const _authRegisterRoute = '/auth/register';
  static const _authLoginRoute = '/auth/login';
  static const _authLogoutRoute = '/auth/logout';
  static const _authFirebaseRoute = '/auth/firebase';
  static const _sendCode = '/auth/sms/send-code';
  static const _authLoginWithSms = '/auth/sms/login';

  Future<void> init() async {
    _dio = Dio(BaseOptions(baseUrl: apiBaseUrl ?? ''))
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (accessToken != null && accessToken != '') {
            if (JwtDecoder.isExpired(accessToken!) &&
                options.path != _authTokenRefreshRoute) await refreshToken();

            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onError: (err, errorHandler) {
          if (err.error is SocketException) {
            log('connection error', name: 'ApiController', error: err.error);
          } else if (err.response != null) {
            switch (err.response?.statusCode) {
              case 401:
                if (token.value != null) {
                  logout();
                }
                break;

              default:
                break;
            }
          }
          errorHandler.next(err);
        },
      ));

    final errorLink = ErrorLink(
      onGraphQLError: (request, forward, response) async* {
        if (response.errors != null) {
          log('graphql server error',
              name: 'ApiController', error: response.errors![0]);
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

    // void sendHeaders() {
    //   try {
    //     final payload = json.encode({
    //       'type': 'connection_init',
    //       'payload': {'headers': _createHeaders()},
    //     });
    //     log('socket send new headers:\n$payload', name: 'ApiController');
    //   } catch (e) {
    //   }
    // }

    socketLink = WebSocketLink(
      graphqlWsEndpoint ?? '',
      config: SocketClientConfig(
          autoReconnect: true,
          initialPayload: () => {'headers': _createHeaders()},
          connect: (url, protocols) {
            socket = IOWebSocketChannel.connect(url,
                protocols: protocols, headers: _createHeaders());

            subscribeSocket();

            return socket!;
          }),
    )..connectOrReconnect();

    final dioLink = DioLink(graphqlEndpoint ?? '', client: _dio);

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

    String? lastToken;
    ever(token, (AuthToken? value) {
      AuthToken? current = value;

      // send new token to socket
      if (lastToken != current?.accessToken) {
        socket?.sink.close();
      }
      lastToken = current?.accessToken;

      // save token
      StoreController.to.saveToken(current);

      if (current != null) {
        final expiresIn = max(900000, current.expiresIn ?? 0);
        Future.delayed(Duration(milliseconds: expiresIn - 120000))
            .then((value) async {
          if (token.value != null) await refreshToken();
        });
      }
    });

    if (token.value != null) await refreshToken();

    return;
  }

  void subscribeSocket() {
    socket?.stream.asBroadcastStream().listen((event) {
      var e = json.decode(event);

      switch (e['type']) {
        case 'connection_ack':
          UserController.to.subscribe();
          break;
        default:
          print('Unimplemented event received $event');
      }
    });
  }

  Future<void> refreshToken() async {
    assert(token.value != null);

    try {
      if (isRefreshing) return;
      isRefreshing = true;
      final result = await _dio.get(_authTokenRefreshRoute, queryParameters: {
        'refresh_token': token.value?.refreshToken,
      });
      token.value = AuthToken(
        accessToken: result.data['jwt_token'],
        expiresIn: 12000,
        refreshToken: result.data['refresh_token'],
      );

      log('token refreshed', name: 'ApiController');
      socketLink.connectOrReconnect();
      isRefreshing = false;
    } catch (error) {
      log(_authTokenRefreshRoute, name: 'ApiController', error: error);
      isRefreshing = false;
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
    // if (FirebaseAuth.instance.currentUser != null) {
    //   await FirebaseAuth.instance.signOut();
    // }
    if (isAuth)
      await _dio.post(_authLogoutRoute,
          queryParameters: {'refresh_token': token.value?.refreshToken});
  }

  // Future<void> loginByFirebase() async {
  //   if (FirebaseAuth.instance.currentUser == null) return;

  //   final idToken = await FirebaseAuth.instance.currentUser.getIdToken();
  //   final result = await Dio(BaseOptions(
  //     baseUrl: apiBaseUrl,
  //     headers: {
  //       'Authorization': 'Bearer $idToken',
  //     },
  //   )).post(_authFirebaseRoute, data: {
  //     'cookie': false,
  //   });

  //   token.value = AuthToken(
  //     accessToken: result.data['jwt_token'],
  //     expiresIn: result.data['jwt_expires_in'],
  //     refreshToken: result.data['refresh_token'],
  //   );
  // }

  Future<void> sendCode(String phone) async {
    final result = await _dio.post(_sendCode, data: {
      'phone_number': phone,
    });
  }

  Future<void> loginWithSms(String code, String phone) async {
    final result = await _dio.post(
      _authLoginWithSms,
      data: {
        'otp': code,
        'phone_number': phone,
      },
    );
    token.value = AuthToken(
      accessToken: result.data['jwt_token'],
      expiresIn: result.data['jwt_expires_in'],
      refreshToken: result.data['refresh_token'],
    );

    await UserController.to.loadUser();
  }

  Map<String, String> _createHeaders() => accessToken != null
      ? <String, String>{'Authorization': 'Bearer $accessToken'}
      : {};
}

class AuthToken {
  /// The access token string as issued by the authorization server.
  final String? accessToken;

  /// The type of token this is, typically just the string “bearer”.
  final String? tokenType;

  /// If the access token expires, the server should reply
  /// with the duration of time the access token is granted for.
  final int? expiresIn;

  /// Token which applications can use to obtain another access token.
  final String? refreshToken;

  /// Application scope granted as defined in https://oauth.net/2/scope
  final String? scope;

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
