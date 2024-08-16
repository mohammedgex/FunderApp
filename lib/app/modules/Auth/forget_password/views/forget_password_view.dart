import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/Auth/forget_password/controllers/forget_password_controller.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/global_widgets/textField.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Forget password".tr,
                      size: 24,
                      weight: FontWeight.w600,
                    ),
                    CustomText(
                      text:
                          "Please enter your phone number to reset your password"
                              .tr,
                      size: 16,
                      weight: FontWeight.w400,
                      color: const Color.fromRGBO(148, 148, 148, 1),
                    )
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      width: double.infinity,
                      icon: const Icon(Icons.call),
                      keyboard: TextInputType.phone,
                      hinttext: "Phone".tr,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.CREATOTP);
                      },
                      child: Button(
                        width: double.infinity,
                        text: "Send Code".tr,
                        buttonColor: const Color.fromRGBO(236, 138, 35, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ));
  }
}
