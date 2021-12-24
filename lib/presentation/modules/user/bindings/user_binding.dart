import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<User1Controller>(
      () => User1Controller(Get.find()),
    );
  }
}
