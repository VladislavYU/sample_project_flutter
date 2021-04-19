import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/app/routes/app_pages.dart';
import 'package:sample_project/controllers/controllers.dart';

enum AuthEnum { SIGNIN, SIGNUP }

class AuthController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final signIn = false.obs;
  void reg() async {
    if (password.value.length < 8) {
      return Get.showSnackbar(GetBar(
        messageText: Text(
          'Пароль должен быть не меньше 8 символов',
          style: TextStyle(color: Colors.white),
        ),
      ));
    }

    try {
      await ApiController.to.register(email.value, password.value);
      await ApiController.to.login(email.value, password.value);
    } on DioError catch (e) {
      if (e.response.data is Map) {
        Get.showSnackbar(
          GetBar(
            duration: Duration(seconds: 3),
            messageText: Text(
              e.response.data['message'].toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  void login() async {
    try {
      await ApiController.to.login(email.value, password.value);
    } on DioError catch (e) {
      if (e.response.data is Map) {
        Get.showSnackbar(
          GetBar(
            duration: Duration(seconds: 3),
            messageText: Text(
              e.response.data['message'].toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  void gohome() async {
    UserController.userId ?? Get.toNamed(Routes.HOME);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
