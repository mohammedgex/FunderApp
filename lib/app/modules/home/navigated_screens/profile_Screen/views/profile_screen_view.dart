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
import 'package:lottie/lottie.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  @override
  Widget build(BuildContext context) {
    final Profile_controller = Get.put(ProfileScreenController());
    final box = GetStorage();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: FutureBuilder(
            future: controller.getUserIdentificaion(),
            builder: (context, snapshotDate) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FutureBuilder(
                      future: controller.getUserDate(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Lottie.asset('assets/loading.json',
                                width: 100, height: 100),
                          );
                        }
                        return Container(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          Container(
                                            width: 80,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: CustomText(
                                              text: "error",
                                            ),
                                          ),
                                      loadingBuilder:
                                          (context, child, loadingProgress) =>
                                              Center(
                                                child: Lottie.asset(
                                                    'assets/loading.json',
                                                    width: 100,
                                                    height: 100),
                                              ),
                                      fit: BoxFit.cover,
                                      "${ApiUrls.URl}/uploads/${snapshot.data!.image}")),
                              const SizedBox(
                                height: 14,
                              ),
                              CustomText(
                                text: snapshot.data!.name,
                                color: const Color.fromRGBO(4, 54, 61, 1),
                                weight: FontWeight.w500,
                                size: 16,
                              ),
                              CustomText(
                                text: snapshot.data!.phone,
                                color: const Color.fromRGBO(4, 54, 61, 1),
                                size: 12,
                                weight: FontWeight.w500,
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (controller.isIdentiy!) {
                                    box.write("registeredEmail",
                                        snapshot.data!.email);
                                    Get.toNamed(Routes.SELECT_TYPE);
                                  }
                                },
                                child: Container(
                                  width: controller.isIdentiy! ? 100 : 60,
                                  height: 25,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: controller.isIdentiy!
                                        ? const Color.fromARGB(255, 236, 73, 61)
                                        : snapshotDate.data!.status == "valid"
                                            ? const Color.fromRGBO(
                                                236, 138, 35, 1)
                                            : const Color.fromARGB(
                                                255, 236, 73, 61),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: controller.isIdentiy!
                                          ? "verfiy account"
                                          : snapshotDate.data!.status == "valid"
                                              ? "vaild"
                                              : snapshotDate.data!.status,
                                      color: Colors.white,
                                      size: 12,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              controller.isIdentiy! ||
                                      snapshotDate.data!.status == "Waiting"
                                  ? const SizedBox()
                                  : snapshotDate.data!.status == "valid"
                                      ? const SizedBox()
                                      : InkWell(
                                          onTap: () => Get.toNamed(
                                              Routes.UPLOAD_ID,
                                              arguments: {
                                                "type": snapshotDate.data!.type,
                                                "isUpdate": true,
                                                "frontSide": snapshotDate
                                                    .data!.frontSide,
                                                "backSide":
                                                    snapshotDate.data!.backSide,
                                              }),
                                          child: CustomText(
                                            text: "update identification",
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
                                            size: 12,
                                            Underline: true,
                                            weight: FontWeight.w500,
                                          ),
                                        )
                            ],
                          ),
                        );
                      }),
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
                            InkWell(
                              onTap: () =>
                                  Get.toNamed(Routes.PERSONALDETAILS_PAGE),
                              child: ProfileTile(
                                text: "Personal details",
                                path: "assets/person_Icon.svg",
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            InkWell(
                                onTap: () => print("Test"),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset("assets/settings.svg"),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        CustomText(
                                          text: "change language".tr,
                                          size: 16,
                                          weight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              4, 54, 61, 1),
                                        )
                                      ],
                                    ),
                                    const SizedBox(),
                                    DropdownButton<Locale>(
                                      dropdownColor: Colors.white,
                                      elevation: 4,
                                      value: Get.locale,
                                      items: [
                                        DropdownMenuItem(
                                          value: const Locale('en', 'US'),
                                          child: CustomText(text: 'English'),
                                        ),
                                        DropdownMenuItem(
                                          value: const Locale('ar', 'AE'),
                                          child: CustomText(text: 'العربية'),
                                        ),
                                      ],
                                      onChanged: (Locale? locale) {
                                        if (locale != null) {
                                          // Save the selected language in GetStorage
                                          final storage = GetStorage();
                                          storage.write('languageCode',
                                              locale.languageCode);
                                          storage.write('countryCode',
                                              locale.countryCode);

                                          // Update the locale
                                          Get.updateLocale(locale);
                                        }
                                      },
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 35,
                            ),
                            InkWell(
                              onTap: () => Get.defaultDialog(
                                  backgroundColor: Colors.white,
                                  barrierDismissible: false,
                                  onWillPop: () async =>
                                      await Get.offAllNamed(Routes.MAIN_PAGE),
                                  title: "",
                                  content: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/logo.svg"),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: CustomText(
                                          text: "log out".tr,
                                          color: const Color.fromRGBO(
                                              4, 54, 61, 1),
                                          size: 15,
                                          weight: FontWeight.w500,
                                        ),
                                      ),
                                      CustomText(
                                        text: "Are you sure want to login out?"
                                            .tr,
                                        size: 14,
                                        cenetr: true,
                                        weight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            148, 148, 148, 1),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Profile_controller.clearToken();
                                          Get.offAllNamed(Routes.LOGIN);
                                        },
                                        child: Button(
                                          width: 252,
                                          text: "log out".tr,
                                          buttonColor: const Color.fromRGBO(
                                              236, 138, 35, 1),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(),
                                        child: Button(
                                          width: 252,
                                          text: "Cancel".tr,
                                          isBorder: true,
                                          buttonColor: const Color.fromRGBO(
                                              255, 255, 255, 1),
                                        ),
                                      )
                                    ],
                                  )),
                              child: ProfileTile(
                                text: "log out".tr,
                                path: "assets/signout.svg",
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              );
            },
          ),
        ));
  }
}
