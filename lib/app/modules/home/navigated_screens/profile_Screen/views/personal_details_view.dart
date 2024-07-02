import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/global_widgets/textField.dart';
import 'package:funder_app/app/modules/home/navigated_screens/profile_Screen/controllers/profile_screen_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      controller: controller.UserName_Controller,
                      icon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 20,
                          child: SvgPicture.asset(
                              "assets/TextField_Icons/username.svg"),
                        ),
                      ),
                      hinttext: "Username",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: controller.PhoneNumber_Controller,
                      icon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 20,
                          child: SvgPicture.asset(
                              "assets/TextField_Icons/phonenumber.svg"),
                        ),
                      ),
                      hinttext: "Phone",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(
                      () => CustomTextField(
                        showen: controller.showPassword.value ? true : false,
                        suficon: InkWell(
                          onTap: () => controller.troglePassword(),
                          child: SizedBox(
                            height: 30,
                            child: controller.showPassword.value
                                ? SvgPicture.asset(
                                    "assets/TextField_Icons/showpassword.svg")
                                : SvgPicture.asset(
                                    "assets/TextField_Icons/hidepassword.svg"),
                          ),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 30,
                            child: SvgPicture.asset(
                                "assets/TextField_Icons/password.svg"),
                          ),
                        ),
                        hinttext: "Password",
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () => print("Ok"),
                      child: CustomText(
                        text: "Rest Password",
                        Underline: true,
                        color: const Color.fromRGBO(4, 54, 61, 1),
                      ),
                    )
                  ],
                ),
              ),
              Obx(() => GestureDetector(
                    onTap: () {
                      print(controller.UserName_Controller.text);
                      print(controller.PhoneNumber_Controller.text);
                      controller.ApiEdit(
                          UserName: controller.UserName_Controller.text,
                          phone: controller.PhoneNumber_Controller.text);
                    },
                    child: controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Color.fromRGBO(236, 138, 35, 1),
                          ))
                        : const Button(
                            width: double.infinity,
                            text: "Next",
                            buttonColor: Color.fromRGBO(236, 138, 35, 1),
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
