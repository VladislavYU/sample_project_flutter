import 'dart:async';
import 'dart:developer';

import 'package:sample_project/generated/graphql/api.graphql.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/extensions.dart';
// import 'package:shawarmania/generated/graphql/api.graphql.dart';

import 'controllers.dart';

class UserController extends DisposableInterface {
  static UserController get to => Get.find();

  final user = Rx<UserMixin>(null);
  final newMessagesCount = RxInt(0);

  static bool get isAuth => to.user.value != null;
  static String get userId => to.user.value?.id;

  bool _susbcribed = false;
  StreamSubscription<QueryResult> _currentUserSubscription;

  Stream<bool> firebaseIsAuth() =>
      FirebaseAuth.instance.authStateChanges().map((event) => event != null);

  Stream<User> firebaseUserChanges() => FirebaseAuth.instance.userChanges();

  Future<void> loadUser(
      {FetchPolicy fetchPolicy = FetchPolicy.networkOnly}) async {
    final query = GetCurrentUserQuery(
      variables: GetCurrentUserArguments(userId: ApiController.to.userId),
    );
    final result =
        await ApiController.query(query.options(fetchPolicy: fetchPolicy));
    if (result.hasException) {
      log('loadUser', error: result.exception, name: 'UserController');
      throw result.exception;
    } else {
      final data = query.parse(result.data);
      if (data.user != null) {
        user.value = data.user;
      } else {
        log('loadUser', error: 'user not found', name: 'UserController');
      }
    }
  }

  @override
  void onInit() {
    var oldAuthorized = StoreController.to.token != null;
    ever(ApiController.to.token, (value) async {
      final authorized = value != null;
      if (authorized == oldAuthorized) return;
      oldAuthorized = authorized;

      if (authorized) {
        await loadUser();
        // await Get.offAllNamed(Routes.ROOT);
      } else {
        unsubscribe();
        // await Get.offAllNamed(Routes.AUTHORIZATION);
        user.value = null;
      }
    });

    super.onInit();
  }

  Future<void> init() async {
    firebaseIsAuth().listen((event) {
      if (event) {
        ApiController.to.loginByFirebase();
      } else {
        ApiController.to.logout();
      }
    });

    if (StoreController.to.token != null) {
      try {
        await loadUser(fetchPolicy: FetchPolicy.cacheOnly);
        log('user loaded from cache', name: 'UserController');
        // update from network
        // ignore: unawaited_futures
        loadUser();
      } catch (e) {
        ApiController.to.token.value = null;
      }
    }
  }

  @override
  void onClose() {
    unsubscribe();
    super.onClose();
  }

  void subscribe() {
    if (_susbcribed || StoreController.to.token == null) return;
    //  current user
    final currentUserSubscription = CurrentUserSubscription(
      variables: CurrentUserArguments(userId: ApiController.to.userId),
    );
    _currentUserSubscription = ApiController.subscribe(
      currentUserSubscription.options(),
    ).listen((event) {
      if (event.hasException) {
        log('CurrentUserSubscription',
            error: event.exception, name: 'UserController');
      } else {
        final result = GetCurrentUserQuery().parse(event.data);
        if (result.user != null) {
          user.value = result.user;
        } else {
          log('CurrentUserSubscription',
              error: 'user not found', name: 'UserController');
        }
      }
    });
    _susbcribed = true;
    log('subscribed', name: 'UserController');
  }

  void unsubscribe() {
    _currentUserSubscription?.cancel();
    _susbcribed = false;
    log('unsubscribed', name: 'UserController');
  }
}
