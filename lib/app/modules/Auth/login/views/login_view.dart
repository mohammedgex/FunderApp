import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/global_widgets/textField.dart';
import 'package:get/get.dart';
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
                      text: "Hello again",
                      size: 24,
                      weight: FontWeight.w600,
                    ),
                    CustomText(
                      text: "Please sign in to access your account",
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
                        hinttext: "Email address",
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
                        }),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextField(
                      hinttext: "Password",
                      controller: controller.Password_Controller,
                      suficon: const Icon(Icons.remove_red_eye),
                      validation: (value) {
                        if (value!.length > 8) {
                          return null;
                        }
                        return "Enter Valid Password";
                      },
                      showen: true,
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
                              text: "Forget password",
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
                                  controller.Email_Controller.text,
                                  controller.Password_Controller.text);
                            }
                          },
                          child: controller.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: Color.fromRGBO(236, 138, 35, 1),
                                ))
                              : const Button(
                                  width: double.infinity,
                                  text: "Login",
                                  buttonColor: Color.fromRGBO(236, 138, 35, 1),
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
                              text: " OR ",
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
                              SvgPicture.asset("assets/socail_media/Apple.svg"),
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
                      text: "Don’t Have an Account ?",
                      color: const Color.fromRGBO(148, 148, 148, 1),
                      weight: FontWeight.w400,
                      size: 14,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.SIGNUP);
                      },
                      child: CustomText(
                        text: " Sing Up",
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
