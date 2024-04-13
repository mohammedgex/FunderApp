import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/verifyId/controllers/verify_id_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SelectType extends GetView<VerifyIdController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      text: "Select the type of document you wish to scan",
                      size: 24,
                      weight: FontWeight.w600,
                    ),
                    CustomText(
                      text:
                          "we need to determine if an identity document is authentic and belongs to you",
                      size: 16,
                      weight: FontWeight.w400,
                      color: const Color.fromRGBO(148, 148, 148, 1),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      height: 55,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color.fromRGBO(4, 54, 61, 1)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/passport.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text: "Passport",
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      height: 55,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color.fromRGBO(4, 54, 61, 1)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/id.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text: "National ID",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.UPLOAD_ID);
                },
                child: const Button(
                  width: double.infinity,
                  text: "Next",
                  buttonColor: Color.fromRGBO(236, 138, 35, 1),
                ),
              ),
            ],
          ),
        )));
  }
}
