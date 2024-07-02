import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/Auth/signup/controllers/signup_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/global_widgets/textField.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(
                  text: "Sign Up",
                  size: 48,
                  weight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Container(
                      width: 106,
                      height: 106,
                      alignment: const Alignment(1.1, 1.25),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: controller.profileImage!.value.path.isEmpty
                                  ? const NetworkImage(
                                      "https://t3.ftcdn.net/jpg/03/64/62/36/360_F_364623623_ERzQYfO4HHHyawYkJ16tREsizLyvcaeg.jpg")
                                  : FileImage(controller.profileImage!.value)
                                      as ImageProvider<Object>),
                          border: Border.all(
                              color: const Color.fromRGBO(4, 54, 61, 1)),
                          borderRadius: BorderRadius.circular(100)),
                      child: GestureDetector(
                        child: SvgPicture.asset("assets/icons/chooseImage.svg"),
                        onTap: () => controller.PickprofileImage(),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    CustomTextField(
                      hinttext: "Full name",
                      keyboard: TextInputType.name,
                      validation: (value) {
                        if (value!.length > 4 && value.contains(' ')) {
                          return null;
                        }
                        return "Enter Valid Name";
                      },
                      controller: controller.Name_Controller,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hinttext: "Phone number",
                      controller: controller.Phone_Controller,
                      keyboard: TextInputType.phone,
                      validation: (value) {
                        if (value!.length == 11 && value.startsWith("01")) {
                          return null;
                        }
                        return "Enter Valid Phone number";
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hinttext: "Email",
                      validation: (value) {
                        if (value != null) {
                          if (value.length > 5 &&
                              value.contains('@') &&
                              value.endsWith('.com')) {
                            return null;
                          }
                          return 'Enter a Valid Email Address';
                        }
                        ;
                      },
                      controller: controller.Email_Controller,
                      keyboard: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() => CustomTextField(
                          hinttext: "Password",
                          validation: (value) {
                            if (value!.length >= 8) {
                              return null;
                            }
                            return "Enter Valid Password";
                          },
                          controller: controller.Password_Controller,
                          suficon: InkWell(
                            onTap: () => controller.troglePassword(),
                            child: SizedBox(
                              child: controller.showPassword.value
                                  ? SvgPicture.asset(
                                      "assets/TextField_Icons/showpassword.svg")
                                  : SvgPicture.asset(
                                      "assets/TextField_Icons/hidepassword.svg"),
                            ),
                          ),
                          showen: controller.showPassword.value ? true : false,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() => CustomTextField(
                          hinttext: "Confirm password",
                          validation: (value) {
                            if (value!.length >= 8) {
                              return null;
                            } else if (controller.Password_Controller ==
                                controller.RePassword_Controller) {
                              return "Passwords not the same";
                            }
                            return "Enter Valid Password";
                          },
                          controller: controller.RePassword_Controller,
                          suficon: InkWell(
                            onTap: () => controller.trogleConfPassword(),
                            child: SizedBox(
                              child: controller.conf_showPassword.value
                                  ? SvgPicture.asset(
                                      "assets/TextField_Icons/showpassword.svg")
                                  : SvgPicture.asset(
                                      "assets/TextField_Icons/hidepassword.svg"),
                            ),
                          ),
                          showen:
                              controller.conf_showPassword.value ? true : false,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() => Checkbox(
                              value: controller.Isckeck.value,
                              activeColor: const Color.fromRGBO(0, 0, 0, 1),
                              onChanged: (val) {
                                controller.checkBox(val);
                              })),
                          GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              text: "Agree with Terms & conditions",
                              weight: FontWeight.w400,
                              size: 13,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                Obx(() => GestureDetector(
                      onTap: () async {
                        if (controller.Isckeck.value &&
                            _formKey.currentState!.validate()) {
                          await controller.ApiRegister(
                              Name: controller.Name_Controller.text,
                              phone: controller.Phone_Controller.text,
                              Password: controller.Password_Controller.text,
                              Email: controller.Email_Controller.text);
                        }
                      },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Color.fromRGBO(236, 138, 35, 1),
                            )
                          : const Button(
                              width: double.infinity,
                              text: "Sign Up",
                              buttonColor: Color.fromRGBO(236, 138, 35, 1),
                            ),
                    )),
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
                      SvgPicture.asset("assets/socail_media/Google.svg"),
                      SvgPicture.asset("assets/socail_media/Apple.svg"),
                      SvgPicture.asset("assets/socail_media/Facebook.svg"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Don’t Have an Account ? ",
                        color: const Color.fromRGBO(148, 148, 148, 1),
                        weight: FontWeight.w400,
                        size: 14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        child: CustomText(
                          text: " Log in",
                          weight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
