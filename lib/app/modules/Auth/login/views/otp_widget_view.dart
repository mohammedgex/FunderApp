import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/Auth/signup/controllers/signup_controller.dart';
import 'package:funder_app/app/modules/global_widgets/OTPwidget.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/Auth/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class OtpWidgetView extends GetView<LoginController> {
  TextEditingController? f_controller = TextEditingController();
  TextEditingController? s_controller = TextEditingController();
  TextEditingController? th_controller = TextEditingController();
  TextEditingController? fo_controller = TextEditingController();

  final PassedData = Get.arguments;

  OtpWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: CustomText(
          text: "Verification code".tr,
          size: 20,
          weight: FontWeight.w600,
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                CustomText(
                  text: "Verification code".tr,
                  size: 20,
                  weight: FontWeight.w600,
                ),
                CustomText(
                  text: "Enter the verification code we sent to".tr,
                  size: 16,
                  weight: FontWeight.w400,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OTPbutton(
                        controller: f_controller,
                      ),
                      OTPbutton(
                        controller: s_controller,
                      ),
                      OTPbutton(
                        controller: th_controller,
                      ),
                      OTPbutton(
                        controller: fo_controller,
                        isLast: true,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Didn’t  receive the code ?".tr,
                      ),
                      InkWell(
                        onTap: () {
                          SignupController().SendOtp(
                              SignupController().Email_Controller.text);
                        },
                        child: CustomText(
                          text: " Resend".tr,
                          size: 16,
                          weight: FontWeight.w700,
                          Underline: true,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.VERIFYOTP(
                    f_controller!.text,
                    s_controller!.text,
                    th_controller!.text,
                    fo_controller!.text,
                    PassedData["Email"]);
              },
              child: Button(
                text: "Verify".tr,
                width: 282,
                buttonColor: const Color.fromRGBO(236, 138, 35, 1),
              ),
            )
          ],
        ),
      )),
    );
  }
}
