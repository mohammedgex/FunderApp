import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignoutDialog extends StatelessWidget {
  const SignoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // shape: StadiumBorder(),
      title: Container(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/SignOuthead.svg",
              width: 41.22,
              height: 45.88,
            ),
            CustomText(
              size: 16,
              weight: FontWeight.w600,
              text: "Sign Out",
              color: const Color.fromRGBO(61, 61, 61, 1),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomText(
              size: 14,
              cenetr: true,
              weight: FontWeight.w400,
              text: "Are you sure you want to Sign out",
              color: const Color.fromRGBO(136, 136, 136, 1),
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () => Get.offAll(Routes.LOGIN),
              child: const Button(
                text: "Sign out",
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Button(
                text: "Cancel",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
