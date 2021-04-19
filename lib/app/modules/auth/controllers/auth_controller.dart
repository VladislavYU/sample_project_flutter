import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sample_project/app/routes/app_pages.dart';
import 'package:sample_project/controllers/controllers.dart';

enum AuthEnum { SIGNIN, SIGNUP }

class AuthController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final signIn = false.obs;
  void reg() async {
    print("qwe");
    try {
      await ApiController.to.register(email.value, password.value);
      await ApiController.to.login(email.value, password.value);
    } on DioError catch (e) {
      print(e);
    }
  }

  void login() async {
    print("qwe");
    try {
      await ApiController.to.login(email.value, password.value);
    } on DioError catch (e) {
      print(e);
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
