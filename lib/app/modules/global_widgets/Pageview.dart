import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:get/get.dart';

class pageViewInde extends GetView<OnboardingController> {
  const pageViewInde(
      {this.content, this.header, this.imageurl, this.controll, this.isTerms});
  final String? imageurl;
  final String? header;
  final String? content;
  final PageController? controll;
  final bool? isTerms;

  @override
  Widget build(BuildContext context) {
    String fontFamily =
        Get.locale?.languageCode == 'ar' ? 'Tajawal-Regular' : 'Lato';
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // content
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // image
                      Container(
                        width: double.infinity,
                        height: 348,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(imageurl!))),
                      ),
                      // text
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              header!,
                              style: TextStyle(
                                  color: const Color.fromRGBO(4, 54, 61, 1),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: fontFamily),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                content!,
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        const Color.fromRGBO(136, 136, 136, 1),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: fontFamily),
                              ),
                            )
                          ],
                        ),
                      ),
                      // container
                    ],
                  ),
                ),
              ],
            ),

            // bottom buttons
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isTerms!) {
                        Get.toNamed(Routes.MAIN_PAGE);
                      } else {
                        Get.offNamed(Routes.LOGIN);
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        if (isTerms!) {
                          Get.offNamed(Routes.MAIN_PAGE);
                        } else {
                          controller.DoneButton();
                        }
                      },
                      child: Text(
                        "Skip".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            fontFamily: fontFamily,
                            color: const Color.fromRGBO(4, 54, 61, 0.66)),
                      ),
                    ),
                  ),
                  Obx(() => GestureDetector(
                        onTap: () {
                          controller.lastPage.value
                              ? isTerms!
                                  ? Get.offAllNamed(Routes.MAIN_PAGE)
                                  : controller.DoneButton()
                              : controll!.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn);
                        },
                        child: controller.lastPage.value
                            ? Button(
                                width: 147,
                                text: "Get started".tr,
                                buttonColor: const Color.fromRGBO(4, 54, 61, 1),
                              )
                            : Button(
                                text: "Next".tr,
                                buttonColor: const Color.fromRGBO(4, 54, 61, 1),
                              ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
