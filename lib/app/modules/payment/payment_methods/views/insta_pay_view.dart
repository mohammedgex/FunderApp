import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/copy_box.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class InstaPayView extends GetView {
  InstaPayView({
    this.payment_title,
    this.payment_body,
    this.payment_body1,
  });
  final String? payment_title;
  final String? payment_body;
  final String? payment_body1;

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${args[0]}",
                    size: 24,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: "${args[1]}",
                    size: 14,
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: "${args[2]}",
                    size: 11,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                copy_Box(
                  title: "The name of the bank".tr,
                  content: args[5] != null ? "${args[5]}" : "EMPTY",
                ),
                copy_Box(
                  title: "The account number".tr,
                  content: args[6] != null ? "${args[6]}" : "EMPTY",
                ),
                copy_Box(
                  title: "The username".tr,
                  content: "Funder",
                ),
              ],
            ),
            CustomText(
              text: "save a copy of payment reciept".tr,
              color: Colors.red,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.UPLOAD_RECEIPT, arguments: [
                args[3], // shares count
                args[4], // id
                args[0], // payment method
              ]),
              child: Button(
                width: 216,
                height: 50,
                text: "Confirm the deposit".tr,
                buttonColor: const Color.fromRGBO(236, 138, 35, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
