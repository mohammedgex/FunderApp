import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class resetPasswordController extends GetxController {
// init local storage
  final box = GetStorage();
  // api url for properties
  static const String URL = ApiUrls.Rese_password_api;
  final Password_Controller = TextEditingController();
  final NewPassword_Controller = TextEditingController();
  final ReNewPassword_Controller = TextEditingController();

  RxBool showPassword = false.obs;
  RxBool showNewPassword = false.obs;
  RxBool showReNewPassword = false.obs;

  // trogle password
  void troglePassword() {
    showPassword.value = !showPassword.value;
  }

  void trogleNewPassword() {
    showNewPassword.value = !showNewPassword.value;
  }

  void trogleReNewPassword() {
    showReNewPassword.value = !showReNewPassword.value;
  }

  Future<void> resetPassword() async {
    final password = Password_Controller.text.trim();
    final newPassword = NewPassword_Controller.text.trim();
    final renewPassword = ReNewPassword_Controller.text.trim();

    if (newPassword.isEmpty &&
        password.isEmpty &&
        renewPassword.isEmpty &&
        newPassword != renewPassword) {
      Get.snackbar('Error', 'Email and Password cannot be empty');
    }

    final response = await http.post(
      Uri.parse(URL),
      headers: {
        // 'Content-Type': 'application/json',
        'Authorization': 'Bearer ${box.read("userToken")}',
        'Accept': 'application/json',
      },
      body: {
        'email': box.read("userEmail"),
        'password': newPassword,
      },
    );

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Password reset successful');
      // Navigate to the next screen if needed
    } else {
      Get.snackbar('Error', 'Failed to reset password');
    }
  }
}
