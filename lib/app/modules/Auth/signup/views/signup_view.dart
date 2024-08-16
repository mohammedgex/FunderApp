import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:funder_app/app/modules/Auth/signup/controllers/signup_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/global_widgets/textField.dart';
import 'package:iconly/iconly.dart';

class SignupView extends GetView<SignupController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTitle(),
                const SizedBox(height: 20),
                _buildProfileImage(),
                const SizedBox(height: 20),
                _buildFormFields(),
                _buildTermsCheckbox(),
                const SizedBox(height: 15),
                _buildSubmitButton(),
                const SizedBox(height: 10),
                _buildSocialMediaRow(width),
                const SizedBox(height: 10),
                _buildSignInRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return CustomText(
      text: "Sign up".tr,
      size: 48,
      weight: FontWeight.w700,
    );
  }

  Widget _buildProfileImage() {
    return Obx(() => Container(
          width: 106,
          height: 106,
          alignment: const Alignment(1.1, 1.25),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: controller.profileImage!.value.path.isEmpty
                  ? const NetworkImage(
                      "https://th.bing.com/th/id/R.4bf044ca84d8348c11a515e6416b4a24?rik=RQeEUs5SDrLK2A&pid=ImgRaw&r=0",
                    )
                  : FileImage(controller.profileImage!.value)
                      as ImageProvider<Object>,
            ),
            border: Border.all(
              color: const Color.fromRGBO(4, 54, 61, 1),
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: GestureDetector(
            child: SvgPicture.asset("assets/icons/chooseImage.svg"),
            onTap: () => controller.PickprofileImage(),
          ),
        ));
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        CustomTextField(
          hinttext: "Full name".tr,
          keyboard: TextInputType.name,
          validation: (value) {
            if (value!.length > 4 && value.contains(' ')) {
              return null;
            }
            return "Enter Valid Name".tr;
          },
          controller: controller.Name_Controller,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hinttext: "Phone".tr,
          controller: controller.Phone_Controller,
          keyboard: TextInputType.phone,
          validation: (value) {
            if (value!.length == 11 && value.startsWith("01")) {
              return null;
            }
            return "Enter Valid Phone number".tr;
          },
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hinttext: "Email address".tr,
          validation: (value) {
            if (value != null &&
                value.length > 5 &&
                value.contains('@') &&
                value.endsWith('.com')) {
              return null;
            }
            return 'Enter a Valid Email Address'.tr;
          },
          controller: controller.Email_Controller,
          keyboard: TextInputType.emailAddress,
        ),
        const SizedBox(height: 15),
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
        const SizedBox(height: 15),
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
      ],
    );
  }

  Widget _buildTermsCheckbox() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Obx(() => Checkbox(
                value: controller.Isckeck.value,
                activeColor: const Color.fromRGBO(0, 0, 0, 1),
                onChanged: (val) {
                  controller.checkBox(val);
                },
              )),
          Row(
            children: [
              CustomText(
                text: "Agree with ".tr,
                weight: FontWeight.w400,
                size: 13,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.TERMS),
                child: CustomText(
                  text: "Terms & conditions".tr,
                  weight: FontWeight.w400,
                  Underline: true,
                  size: 13,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Obx(() => GestureDetector(
          onTap: () async {
            if (controller.Isckeck.value && _formKey.currentState!.validate()) {
              try {
                await controller.ApiRegister(
                  Name: controller.Name_Controller.text,
                  phone: controller.Phone_Controller.text,
                  Password: controller.Password_Controller.text,
                  Email: controller.Email_Controller.text,
                );
              } catch (e) {
                // Handle API errors
                Get.snackbar("Error", e.toString());
              }
            }
          },
          child: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: Color.fromRGBO(236, 138, 35, 1),
                )
              : Button(
                  width: double.infinity,
                  text: "Sign up".tr,
                  buttonColor: const Color.fromRGBO(236, 138, 35, 1),
                ),
        ));
  }

  Widget _buildSocialMediaRow(double width) {
    return SizedBox(
      width: width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset("assets/socail_media/Google.svg"),
          SvgPicture.asset("assets/socail_media/Facebook.svg"),
        ],
      ),
    );
  }

  Widget _buildSignInRow() {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: "You Have an Account ? ".tr,
            color: const Color.fromRGBO(148, 148, 148, 1),
            weight: FontWeight.w400,
            size: 14,
          ),
          GestureDetector(
            onTap: () {
              Get.offAllNamed(Routes.LOGIN);
            },
            child: CustomText(
              text: "Sign in".tr,
              weight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
