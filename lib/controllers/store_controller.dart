import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'controllers.dart';

const _storeKey = 'store';
const _cacheKey = 'cache';

class StoreController extends DisposableInterface {
  static StoreController get to => Get.find();
  final box = GetStorage(_storeKey);
  final _secureStorage = FlutterSecureStorage();
  final apiStore = _GetStore();

  AuthToken _token;
  AuthToken get token => _token;

  Future<void> init() async {
    try {
      await GetStorage.init(_storeKey);
    } catch (e) {
      log('init storage Store', name: 'StoreController', error: e);
      await box.erase();
    }

    try {
      await GetStorage.init(_cacheKey);
    } catch (e) {
      log('init storage ApiCache', name: 'StoreController', error: e);
      await apiStore.box.erase();
    }

    try {
      await loadToken();
    } catch (e) {
      log('init loadToken', name: 'StoreController', error: e);
    }
  }

  Future<void> loadToken() async {
    try {
      final value = await _secureStorage.read(key: 'token');
      if (value == null) return null;
      _token = AuthToken.parse(value);
    } catch (e) {
      log('parse token error', name: 'StoreController', error: e);
    }
  }

  Future<void> saveToken(AuthToken token) async {
    _token = token;
    try {
      if (token == null) {
        await _secureStorage.delete(key: 'token');
        log('removed token from secure storage', name: 'StoreController');
      } else {
        await _secureStorage.write(key: 'token', value: token.toString());
        log('saved token in secure storage', name: 'StoreController');
      }
    } catch (e) {
      log('save token error', name: 'StoreController', error: e);
    }
  }
}

@immutable
class _GetStore extends Store {
  final box = GetStorage(_cacheKey);

  @override
  Map<String, dynamic> get(String dataId) => box.read(dataId);

  @override
  void put(String dataId, Map<String, dynamic> value) =>
      box.write(dataId, value);

  @override
  void putAll(Map<String, Map<String, dynamic>> data) =>
      data.forEach((key, value) => box.write(key, value));

  @override
  void delete(String dataId) => box.remove(dataId);

  @override
  Map<String, Map<String, dynamic>> toMap() {
    final result = <String, Map<String, dynamic>>{};
    box
        .getKeys<Iterable<String>>()
        .forEach((key) => result[key] = box.read(key));
    return Map.unmodifiable(result);
  }

  @override
  Future<void> reset() => box.erase();
}
