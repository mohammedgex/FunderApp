import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/Auth/forget_password/controllers/forget_password_controller.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/global_widgets/textField.dart';
import 'package:get/get.dart';

class creatPasswordView extends GetView<ForgetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: CustomText(
            text: "Create Password",
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
          child: SafeArea(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Create password",
                        size: 24,
                        weight: FontWeight.w600,
                      ),
                      CustomText(
                        text: "Please enter a secure password for your account",
                        size: 16,
                        weight: FontWeight.w400,
                        color: const Color.fromRGBO(148, 148, 148, 1),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        width: double.infinity,
                        hinttext: "Password",
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      CustomTextField(
                        width: double.infinity,
                        hinttext: "Confirm password",
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Button(
                        width: double.infinity,
                        text: "Next",
                        buttonColor: Color.fromRGBO(236, 138, 35, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
