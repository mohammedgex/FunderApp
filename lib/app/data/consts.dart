import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class Kconstans {
  static void showDialog(
      {String? title, String? content, bool? show, String? routeName}) {
    Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: () async => await Get.offAndToNamed(Routes.MAIN_PAGE),
        title: "",
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            show!
                ? SvgPicture.asset("assets/icons/succ_verify.svg")
                : const SizedBox(),
            show
                ? const SizedBox(
                    height: 35,
                  )
                : const SizedBox(),
            show
                ? Center(
                    child: CustomText(
                      text: title,
                      color: const Color.fromRGBO(236, 138, 35, 1),
                      size: 20,
                      weight: FontWeight.w700,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 35,
            ),
            CustomText(
              text: content,
              size: 16,
              cenetr: true,
              weight: FontWeight.w400,
            ),
            const SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: () => Get.offAllNamed(routeName!),
              child: const Button(
                width: 252,
                text: "Continue",
                buttonColor: Color.fromRGBO(236, 138, 35, 1),
              ),
            )
          ],
        ));
  }
}
