import 'dart:async';

import 'package:get/get.dart';
import 'package:sample_project/domain/models/user.dart';
import 'package:sample_project/domain/repository/user_repository.dart';

class User1Controller extends GetxController {
  final UserRepository _userRepository;

  final currentUser = Rxn<User>();
  final isLoading = false.obs;
  final isError = false.obs;

  User1Controller(this._userRepository);

  late StreamSubscription _userSubscribe;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  @override
  void onReady() {
    super.onReady();
    subscribeOnUser();
  }

  Future<void> getCurrentUser() async {
    try {
      isLoading.value = true;
      currentUser.value = await _userRepository.getCurrentUser();
    } catch (e, s) {
      print(e);
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  void subscribeOnUser() {
    _userSubscribe = _userRepository.sibscriptionCurrentUser().listen((event) {
      if (event != null) currentUser.value = event;
    });
  }

  @override
  void onClose() {
    _userSubscribe.cancel();
    super.onClose();
  }
}
