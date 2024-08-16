import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

import 'package:get/get.dart';

import '../controllers/terms_controller.dart';

class TermsView extends GetView<TermsController> {
  const TermsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomText(
                text: "Terms and conditions",
                size: 32,
                weight: FontWeight.w700,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "1.termes",
                      size: 20,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ",
                      size: 14,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
