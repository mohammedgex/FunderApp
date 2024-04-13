import 'package:flutter/material.dart';
import 'package:funder_app/app/data/Auth/LoginModel.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final box = GetStorage();

  // loading stauts
  RxBool isLoading = false.obs;

  // TextField Controller init

  late TextEditingController Email_Controller;
  late TextEditingController Password_Controller;

  // when page navigated
  @override
  void onInit() {
    Email_Controller = TextEditingController();
    Password_Controller = TextEditingController();
    super.onInit();
  }

  // store token and user data from api
  LoginModel? userData;

  // api urls
  final String URL = ApiUrls.Login_api;
  final String VERIFY_URL = ApiUrls.OTP_api;

  // LOGIN API CONNECT
  Future<void> ApiLogin(String Email, String Password) async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse(URL),
        body: jsonEncode({'email': Email, 'password': Password}),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("Conected");
        final data = jsonDecode(response.body);
        print("MAP DATA : $data");
        userData = LoginModel.fromJson(data);
        print("USERTOKEN : $userData!.token");
        box.write("userToken", userData!.token);
        print(box.read("userToken"));
        isLoading.value = false;
        Get.offAllNamed(Routes.MAIN_PAGE);
      } else {
        Get.defaultDialog(
            title: "Error",
            titleStyle: const TextStyle(
                fontFamily: "Lato", fontWeight: FontWeight.w700),
            backgroundColor: Colors.white,
            textCancel: "DISMISS",
            content: CustomText(
              cenetr: true,
              text:
                  "Invalid login credentials. please check your email and password and try again.",
            ));
        isLoading.value = false;
      }
    } catch (error) {
      isLoading.value = false;
      print("error : $error");
    }
  }

  // OTP VERIFICATION
  void VERIFYOTP(String FIRST, String SECOND, String THIRD, String FOURTH,
      String Email) async {
    String FUll_OTP = FIRST + SECOND + THIRD + FOURTH;
    print(FUll_OTP);
    try {
      final response = await http.post(
        Uri.parse(VERIFY_URL),
        body: jsonEncode({'email': Email, 'otp': FUll_OTP}),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("OTP VERIFIED");
        Get.toNamed(Routes.VERIFY_ID);
      } else {
        Get.defaultDialog(
            title: "Error",
            titleStyle: const TextStyle(
                fontFamily: "Lato", fontWeight: FontWeight.w700),
            backgroundColor: Colors.white,
            textCancel: "DISMISS",
            content: CustomText(
              cenetr: true,
              text: "Invalid OTP credentials.",
            ));
      }
    } catch (error) {
      print("error : $error");
    }
  }
}
