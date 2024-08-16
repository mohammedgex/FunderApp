import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  late TextEditingController Password_Controller;
  late TextEditingController RePassword_Controller;

  @override
  void onInit() {
    Password_Controller = TextEditingController();
    RePassword_Controller = TextEditingController();
    super.onInit();
  }

  RxBool showPassword = true.obs;

  // confirm password variable
  RxBool conf_showPassword = true.obs;

  // trogle password
  void troglePassword() {
    showPassword.value = !showPassword.value;
  }

  // trogle password
  void trogleConfPassword() {
    conf_showPassword.value = !conf_showPassword.value;
  }
}
