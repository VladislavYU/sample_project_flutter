import 'package:get/get.dart';
import 'package:sample_project/controllers/api_controller.dart';
import 'package:sample_project/presentation/routes/app_pages.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    try {
      await ApiController.to.login('sample@gmail.com', 'qweqweqwe');
      Get.toNamed(Routes.USER);
    } catch (error) {
      print(error);
    }
    super.onReady();
  }
}
