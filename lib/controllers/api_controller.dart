import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' show max;

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gql_dio_link/gql_dio_link.dart' hide HttpLinkHeaders;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// import '../models/uploaded_file.dart';
import 'controllers.dart';

class ApiController extends DisposableInterface {
  ApiController({
    @required this.graphqlEndpoint,
    @required this.graphqlWsEndpoint,
    @required this.apiBaseUrl,
    @required this.storageBaseUrl,
    @required this.organizationId,
  });

  static ApiController get to => Get.find<ApiController>();

  final String? graphqlEndpoint;
  final String? graphqlWsEndpoint;
  final String? apiBaseUrl;
  final String? storageBaseUrl;
  final String? organizationId;

  final _reconnectController = StreamController<String>.broadcast();
  Stream get reconnectedStream => _reconnectController.stream;

  WebSocketChannel? socket;

  late WebSocketLink socketLink;

  bool isRefreshing = false;

  static String getFileUrl(String? path) {
    if (path == null) return '';
    if (path.toLowerCase().contains('http')) return path;
    return <String>[to.storageBaseUrl ?? '', (path)].join('/');
  }

  static String getSmallFileUrl(String? path) {
    if (path == null) return '';
    if (path.toLowerCase().contains('http')) return path;
    return <String>[to.storageBaseUrl ?? '', (path)].join('/') +
        '?w=600&q=100&f=auto';
  }

  late GraphQLClient _client;
  static GraphQLClient get client => to._client;

  static Future<QueryResult> Function(MutationOptions) get mutate =>
      client.mutate;
  static Future<QueryResult> Function(QueryOptions) get query => client.query;
  static Stream<QueryResult> Function(SubscriptionOptions) get subscribe =>
      client.subscribe;
  static ObservableQuery Function(WatchQueryOptions) get watchQuery =>
      client.watchQuery;

  late Dio _dio;
  static Dio get dio => to._dio;

  final token = Rxn<AuthToken>(StoreController.to.token);
  // final anonToken = Rxn<String>(StoreController.to.anonToken);
  String? get accessToken => token.value?.accessToken;

  String? get userId {
    if (accessToken == null) return null;
    final result = JwtDecoder.decode(accessToken!);
    return result['https://hasura.io/jwt/claims']['userId'];
  }

  static const _authTokenRefreshRoute = '/auth/token/refresh';
  static const _authRegisterRoute = '/auth/register';
  static const _authLoginRoute = '/auth/login';
  static const _authLogoutRoute = '/auth/logout';
  static const _authFirebaseRoute = '/auth/firebase';
  static const _callUser = '/auth/sms/call-user';
  static const _authLoginWithSms = '/auth/sms/login';
  static const _authLoginWithQrCode = '/auth/erp/qr-code';
  static const _authCall = '/auth/call';
  static const _authCallLogin = '/auth/call/login';
  static const _anonToken = '/auth/login/anonymous';

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
          if (kDebugMode) log(accessToken ?? '');

          if (accessToken != null &&
              accessToken != '' &&
              !options.path.contains(_authTokenRefreshRoute)) {
            if (JwtDecoder.isExpired(accessToken!) &&
                options.path != _authTokenRefreshRoute) await refreshToken();

            options.headers['Authorization'] = 'Bearer $accessToken';
            options.headers['x-hasura-role'] = 'BUYER';
          } else {
            options.headers['x-hasura-role'] = 'ANONYMOUS';

            // if (anonToken.value != null &&
            //     anonToken.value != '' &&
            //     options.path != _authCall &&
            //     options.path != _authCallLogin &&
            //     options.path != _authTokenRefreshRoute) {
            //   options.headers['Authorization'] = 'Bearer ${anonToken.value}';
            // }
          }
          options.headers['x-organization-id'] = organizationId;
          options.headers['x-locale'] = 'ru_RU';
          log("Subscribe test ${options.headers}");
          return handler.next(options);
        },
        onError: (err, errorHandler) {
          if (err.error is SocketException) {
            log('connection error', name: 'ApiController', error: err.error);
          } else if (err.response != null) {
            switch (err.response?.statusCode) {
              case 401:
                if (token.value != null) {
                  if (err.response?.data != null) {
                    if (err.response?.data is Map<String, dynamic>) {
                      final data = err.response?.data as Map<String, dynamic>;
                      if (data.containsKey('message')) {
                        if (data['message'].contains('expired refresh token') ||
                            data['message'].contains('Refresh token expired') ||
                            data['message']
                                .contains('Refresh token is not valid')) {
                          logout();
                        }
                      }
                    } else if (err.response?.data is String) {
                      if ((err.response?.data as String)
                              .contains('expired refresh token') ||
                          (err.response?.data as String)
                              .contains('Refresh token expired') ||
                          (err.response?.data as String)
                              .contains('Refresh token is not valid')) {
                        logout();
                      }
                    }
                  }
                } else {
                  refreshToken();
                }
                break;
              default:
                break;
            }
          }
          errorHandler.next(err);
        },
      ));

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final errorLink = ErrorLink(
      onGraphQLError: (request, forward, response) async* {
        if (response.errors != null) {
          log('graphql server error',
              name: 'ApiController', error: response.errors![0]);
        }

        yield* forward(request);
      },
      onException: (request, forward, exception) async* {
        log('graphql client exception',
            name: 'ApiController', error: exception);

        yield* forward(request);
      },
    );

    socketLink = WebSocketLink(
      graphqlWsEndpoint ?? '',
      config: SocketClientConfig(
          autoReconnect: true,
          initialPayload: () => {'headers': _createHeaders()},
          connectFn: (url, protocols) {
            socket = IOWebSocketChannel.connect(
              url,
              protocols: protocols,
              // headers: _createHeaders(),
            );

            socket = (socket as WebSocketChannel).forGraphQL();

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
    // if (anonToken.value == null) {
    //   String? _getAnonToken = await getAnonToken();

    //   if (_getAnonToken != null) {
    //     StoreController.to.saveAnonToken(_getAnonToken);
    //     anonToken.value = _getAnonToken;
    //   }
    // }

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

  void subscribeSocket() async {
    socket?.stream.asBroadcastStream().listen((event) {
      var e = json.decode(event);
      switch (e['type']) {
        case 'connection_ack':
          UserController.to.unsubscribe();
          UserController.to.subscribe();
          _reconnectController.add('event');
          break;
        default:
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
    } catch (error, stackTrace) {
      log(_authTokenRefreshRoute, name: 'ApiController', error: error);
      // EH.ErrorHandler.sendErrorToSentry(error, stackTrace);
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

  Future<bool> logout() async {
    final isAuth = token.value != null;
    token.value = null;
    return token.value == null;

    // if (FirebaseAuth.instance.currentUser != null) {
    //   await FirebaseAuth.instance.signOut();
    // }
    // if (isAuth) {
    //   await _dio.post(_authLogoutRoute,
    //       queryParameters: {'refresh_token': token.value?.refreshToken});
    // }
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

  Future<String?> getAnonToken() async {
    try {
      final result = await _dio.post(_anonToken, data: {});

      return result.data;
    } catch (error) {
      log(_anonToken, name: 'ApiController', error: error);
    }
    return null;
  }

  Future<void> callUser(String phone) async {
    final result = await _dio.post(_callUser, data: {
      'phone_number': phone,
    });
  }

  Future<void> sendCall(String phone) async {
    final result = await _dio.post(_authCall, data: {
      'phone_number': phone,
    });
  }

  Future<void> loginWithCall(String code, String phone) async {
    final result = await _dio.post(
      _authCallLogin,
      data: {
        'code': code,
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

  Future<void> loginWithSms(String code, String phone) async {
    final result = await _dio.post(
      _authLoginWithSms,
      data: {
        'code': code,
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

  Future<void> loginWithQrCode(String qrCode) async {
    final result = await _dio.post(
      _authLoginWithQrCode,
      data: {
        'qr_code': qrCode,
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
      ? <String, String>{
          'Authorization': 'Bearer $accessToken',
          'x-hasura-role': 'BUYER',
        }
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
