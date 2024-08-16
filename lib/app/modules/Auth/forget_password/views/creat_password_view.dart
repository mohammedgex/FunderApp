import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/Auth/forget_password/controllers/forget_password_controller.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/global_widgets/textField.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class creatPasswordView extends GetView<ForgetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: CustomText(
            text: "Create Password".tr,
            size: 20,
            weight: FontWeight.w600,
          ),
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
                      text: "Create Password".tr,
                      size: 24,
                      weight: FontWeight.w600,
                    ),
                    CustomText(
                      text:
                          "Please enter a secure password for your account".tr,
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
                    Obx(() => CustomTextField(
                          hinttext: "Password".tr,
                          validation: (value) {
                            if (value!.length >= 8) {
                              return null;
                            }
                            return "Enter Valid Password".tr;
                          },
                          controller: controller.Password_Controller,
                          suficon: InkWell(
                            onTap: () => controller.troglePassword(),
                            child: Icon(
                              controller.showPassword.value
                                  ? IconlyLight.show
                                  : IconlyLight.hide,
                              color: const Color.fromRGBO(105, 106, 108, 0.8),
                            ),
                          ),
                          showen: controller.showPassword.value,
                        )),
                    const SizedBox(
                      height: 18,
                    ),
                    Obx(() => CustomTextField(
                          hinttext: "Confirm password".tr,
                          validation: (value) {
                            if (value!.length >= 8) {
                              if (controller.Password_Controller.text ==
                                  controller.RePassword_Controller.text) {
                                return null;
                              }
                              return "Passwords not the same".tr;
                            }
                            return "Enter Valid Password".tr;
                          },
                          controller: controller.RePassword_Controller,
                          suficon: InkWell(
                            onTap: () => controller.trogleConfPassword(),
                            child: Icon(
                              controller.conf_showPassword.value
                                  ? IconlyLight.show
                                  : IconlyLight.hide,
                              color: const Color.fromRGBO(105, 106, 108, 0.8),
                            ),
                          ),
                          showen: controller.conf_showPassword.value,
                        )),
                    const SizedBox(
                      height: 18,
                    ),
                    Button(
                      width: double.infinity,
                      text: "Next".tr,
                      buttonColor: const Color.fromRGBO(236, 138, 35, 1),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ));
  }
}
