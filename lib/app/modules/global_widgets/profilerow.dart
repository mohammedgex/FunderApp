import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProfileTile extends StatelessWidget {
  String? text;
  String? path;

  ProfileTile({super.key, this.text, this.path});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(path!),
            const SizedBox(
              width: 8,
            ),
            CustomText(
              text: text!.tr,
              size: 16,
              weight: FontWeight.w600,
              color: const Color.fromRGBO(4, 54, 61, 1),
            )
          ],
        ),
        const SizedBox(),
        const Icon(
          Icons.arrow_forward_ios,
          color: Color.fromRGBO(4, 54, 61, 1),
          size: 20,
        )
      ],
    );
  }
}
