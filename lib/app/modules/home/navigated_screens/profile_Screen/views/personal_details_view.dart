import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/global_widgets/textField.dart';
import 'package:funder_app/app/modules/home/navigated_screens/profile_Screen/controllers/profile_screen_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconly/iconly.dart';

class PersonalDetails extends GetView<ProfileScreenController> {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    // final double screenHeight = MediaQuery.of(context).size.height;
    // final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: bottom_NavigationBar(controller: controller),
      body: SizedBox(
        // height: screenHeight - keyboardHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Container(
                    width: 128,
                    height: 132,
                    alignment: const Alignment(1.0, 1.15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: controller.profileImage!.value.path.isEmpty
                                ? NetworkImage(
                                    "${ApiUrls.URl}/uploads/${box.read("userImage")}")
                                : FileImage(controller.profileImage!.value)
                                    as ImageProvider<Object>),
                        borderRadius: BorderRadius.circular(100)),
                    child: GestureDetector(
                      child: SvgPicture.asset("assets/icons/chooseImage.svg"),
                      onTap: () => controller.PickprofileImage(),
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    controller: controller.UserName_Controller,
                    icon: const Icon(IconlyLight.profile),
                    hinttext: "Username".tr,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    controller: controller.PhoneNumber_Controller,
                    icon: const Icon(IconlyLight.call),
                    hinttext: "Phone".tr,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.RESET_PASSWORD),
                    child: CustomText(
                      text: "Reset Password".tr,
                      Underline: true,
                      color: const Color.fromRGBO(4, 54, 61, 1),
                    ),
                  )
                ],
              ),
              Obx(() => GestureDetector(
                    onTap: () {
                      controller.ApiEdit(
                          UserName: controller.UserName_Controller.text,
                          phone: controller.PhoneNumber_Controller.text);
                    },
                    child: controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Color.fromRGBO(236, 138, 35, 1),
                          ))
                        : Button(
                            width: double.infinity,
                            text: "Next".tr,
                            buttonColor: const Color.fromRGBO(236, 138, 35, 1),
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
