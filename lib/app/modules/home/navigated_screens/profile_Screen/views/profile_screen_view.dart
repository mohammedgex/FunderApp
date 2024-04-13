import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/profilerow.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/profile_Screen/controllers/profile_screen_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  @override
  Widget build(BuildContext context) {
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
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg")),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomText(
                      text: "Maryam Moayyad",
                      color: const Color.fromRGBO(4, 54, 61, 1),
                      weight: FontWeight.w500,
                      size: 16,
                    ),
                    CustomText(
                      text: "+19283845542",
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
                          onTap: () => print("Test"),
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
