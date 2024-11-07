import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/global_widgets/textField.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controllers/resetPassword_controller.dart';

class resetPasswordView extends GetView<resetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Reset Password".tr,
            size: 20,
            weight: FontWeight.w600,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Create a new password".tr,
                    size: 16,
                    weight: FontWeight.w700,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Obx(
                          () => CustomTextField(
                            controller: controller.Password_Controller,
                            showen:
                                controller.showPassword.value ? false : true,
                            icon: const Icon(IconlyLight.lock),
                            suficon: GestureDetector(
                              onTap: () => controller.troglePassword(),
                              child: controller.showPassword.value
                                  ? const Icon(IconlyLight.show)
                                  : const Icon(IconlyLight.hide),
                            ),
                            hinttext: "Password".tr,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(
                          () => CustomTextField(
                            controller: controller.NewPassword_Controller,
                            showen:
                                controller.showNewPassword.value ? false : true,
                            icon: const Icon(IconlyLight.lock),
                            suficon: GestureDetector(
                              onTap: () => controller.trogleNewPassword(),
                              child: controller.showNewPassword.value
                                  ? const Icon(IconlyLight.show)
                                  : const Icon(IconlyLight.hide),
                            ),
                            hinttext: "New Password".tr,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(
                          () => CustomTextField(
                            controller: controller.ReNewPassword_Controller,
                            showen: controller.showReNewPassword.value
                                ? false
                                : true,
                            icon: const Icon(IconlyLight.lock),
                            suficon: GestureDetector(
                              onTap: () => controller.trogleReNewPassword(),
                              child: controller.showReNewPassword.value
                                  ? const Icon(IconlyLight.show)
                                  : const Icon(IconlyLight.hide),
                            ),
                            hinttext: "Confirm password".tr,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => controller.resetPassword(context),
                child: Button(
                  width: double.infinity,
                  text: "Save".tr,
                  buttonColor: const Color.fromRGBO(236, 138, 35, 1),
                ),
              )
            ],
          ),
        ));
  }
}
