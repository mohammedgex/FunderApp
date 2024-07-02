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
            Container(
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
            Container(
              child: Column(
                children: [
                  copy_Box(
                    title: "The name of the bank",
                    content: "${args[5]}",
                  ),
                  copy_Box(
                    title: "The account number",
                    content: "${args[6]}",
                  ),
                  const copy_Box(
                    title: "The username",
                    content: "Funder",
                  ),
                ],
              ),
            ),
            CustomText(
              text: " save a copy of payment reciept",
              color: Colors.red,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.UPLOAD_RECEIPT, arguments: [
                args[3],
                args[4],
                args[0],
              ]),
              child: const Button(
                width: 216,
                height: 50,
                text: "Confirm the deposit",
                buttonColor: Color.fromRGBO(236, 138, 35, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}