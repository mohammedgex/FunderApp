import 'package:get/get.dart';

import '../controllers/resetPassword_controller.dart';

class resetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<resetPasswordController>(
      () => resetPasswordController(),
    );
  }
}
