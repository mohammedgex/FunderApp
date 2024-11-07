// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/Pageview.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  PageController control = PageController();

  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: control,
            onPageChanged: (value) {
              controller.LastVal(value);
            },
            children: [
              pageViewInde(
                header: "Welcome to funder!".tr,
                content:
                    "Get ready to simplify your renting experience with our user-friendly platform"
                        .tr,
                imageurl: "assets/image1.jfif",
                controll: control,
                isTerms:
                    (data != null && data["isTerms"] != null) ? true : false,
              ),
              pageViewInde(
                header: "We’re excited to have you on board!".tr,
                content:
                    "Your on board use our intuitive search feature to discover available properties that match your preferences"
                        .tr,
                imageurl: "assets/image2.jfif",
                controll: control,
                isTerms:
                    (data != null && data["isTerms"] != null) ? true : false,
              ),
              pageViewInde(
                header: "Congratulation!".tr,
                content:
                    "Let's get started sign up or log in to assess all the features and benefits  of our application"
                        .tr,
                imageurl: "assets/image1.jfif",
                controll: control,
                isTerms:
                    (data != null && data["isTerms"] != null) ? true : false,
              )
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.65),
            child: SmoothPageIndicator(
              controller: control,
              count: 3,
              axisDirection: Axis.horizontal,
              effect: const SlideEffect(
                  spacing: 8.0,
                  radius: 10.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1.5,
                  dotColor: Color.fromRGBO(4, 54, 61, 1),
                  activeDotColor: Color.fromRGBO(4, 54, 61, 1)),
            ),
          )
        ],
      )),
    );
  }
}
