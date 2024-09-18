// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/global_widgets/textField.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Hello again".tr,
                      size: 24,
                      weight: FontWeight.w600,
                    ),
                    CustomText(
                      text: "Please sign in to access your account".tr,
                      size: 16,
                      weight: FontWeight.w400,
                      color: const Color.fromRGBO(148, 148, 148, 1),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                        hinttext: "Email address".tr,
                        keyboard: TextInputType.emailAddress,
                        controller: controller.Email_Controller,
                        validation: (value) {
                          if (value != null) {
                            if (value.length > 5 &&
                                value.contains('@') &&
                                value.endsWith('.com')) {
                              return null;
                            }
                            return 'Enter a Valid Email Address';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 18,
                    ),
                    Obx(
                      () => CustomTextField(
                        hinttext: "Password".tr,
                        controller: controller.Password_Controller,
                        suficon: GestureDetector(
                          onTap: () => controller.troglePassword(),
                          child: controller.showPassword.value
                              ? const Icon(IconlyLight.hide)
                              : const Icon(IconlyLight.show),
                        ),
                        validation: (value) {
                          if (value!.length >= 8) {
                            return null;
                          }
                          return "Enter Valid Password";
                        },
                        showen: controller.showPassword.value ? false : true,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.FOGETPASSWORD);
                            },
                            child: CustomText(
                              text: "Forget password".tr,
                              Underline: true,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller.ApiLogin(
                                  controller.Email_Controller.text.toString(),
                                  controller.Password_Controller.text
                                      .toString());
                            }
                          },
                          child: controller.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: Color.fromRGBO(236, 138, 35, 1),
                                ))
                              : Button(
                                  width: double.infinity,
                                  text: "Sign in".tr,
                                  buttonColor:
                                      const Color.fromRGBO(236, 138, 35, 1),
                                ),
                        )),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 176,
                          child: Row(children: <Widget>[
                            const Expanded(
                                child: Divider(
                              color: Color.fromRGBO(156, 154, 165, 0.3),
                            )),
                            CustomText(
                              text: "OR".tr,
                              color: const Color.fromRGBO(156, 154, 165, 0.3),
                            ),
                            const Expanded(
                                child: Divider(
                              color: Color.fromRGBO(156, 154, 165, 0.3),
                            )),
                          ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 124,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  "assets/socail_media/Google.svg"),
                              SvgPicture.asset(
                                  "assets/socail_media/Facebook.svg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don't Have an Account ? ".tr,
                      color: const Color.fromRGBO(148, 148, 148, 1),
                      weight: FontWeight.w400,
                      size: 14,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.SIGNUP);
                      },
                      child: CustomText(
                        text: "Sign up".tr,
                        weight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
