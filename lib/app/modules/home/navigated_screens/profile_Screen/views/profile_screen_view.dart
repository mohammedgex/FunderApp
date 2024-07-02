import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/profilerow.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/profile_Screen/controllers/profile_screen_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final Profile_controller = Get.put(ProfileScreenController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 128,
                      height: 132,
                      alignment: const Alignment(1.0, 1.15),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${ApiUrls.URl}/uploads/${box.read("userImage")}")),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomText(
                      text: "${box.read("userName")}",
                      color: const Color.fromRGBO(4, 54, 61, 1),
                      weight: FontWeight.w500,
                      size: 16,
                    ),
                    CustomText(
                      text: "${box.read("userPhone")}",
                      color: const Color.fromRGBO(4, 54, 61, 1),
                      size: 12,
                      weight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  height: 362,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.PERSONALDETAILS_PAGE),
                          child: ProfileTile(
                            text: "Personal details",
                            path: "assets/person_Icon.svg",
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        GestureDetector(
                          onTap: () => print("Test"),
                          child: ProfileTile(
                            text: "Setting",
                            path: "assets/settings.svg",
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        GestureDetector(
                          onTap: () => Get.defaultDialog(
                              backgroundColor: Colors.white,
                              barrierDismissible: false,
                              onWillPop: () async =>
                                  await Get.offAllNamed(Routes.MAIN_PAGE),
                              title: "",
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/logo.svg"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: CustomText(
                                      text: "Sign out",
                                      color: const Color.fromRGBO(4, 54, 61, 1),
                                      size: 15,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                  CustomText(
                                    text: "Are you sure want to sign out?",
                                    size: 14,
                                    cenetr: true,
                                    weight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(148, 148, 148, 1),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Profile_controller.clearToken();
                                      Get.offAllNamed(Routes.LOGIN);
                                    },
                                    child: const Button(
                                      width: 252,
                                      text: "Sign out",
                                      buttonColor:
                                          Color.fromRGBO(236, 138, 35, 1),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: const Button(
                                      width: 252,
                                      text: "Cancel",
                                      isBorder: true,
                                      buttonColor:
                                          Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  )
                                ],
                              )),
                          child: ProfileTile(
                            text: "Sign out",
                            path: "assets/signout.svg",
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
