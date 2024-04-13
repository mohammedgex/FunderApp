import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/verify_id_controller.dart';

class VerifyIdView extends GetView<VerifyIdController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: CustomText(
          text: "Verify ID",
          size: 20,
          weight: FontWeight.w600,
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                "assets/id.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "We need to verify your ID",
                    cenetr: true,
                    size: 20,
                    weight: FontWeight.w700,
                  ),
                  CustomText(
                    text:
                        "In order to create an account we need to be 100% sure you are you ",
                    size: 16,
                    weight: FontWeight.w400,
                    cenetr: true,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.SELECT_TYPE);
              },
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.UPLOAD_ID);
                },
                child: const Button(
                  width: 278,
                  text: "Verify",
                  buttonColor: Color.fromRGBO(236, 138, 35, 1),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
