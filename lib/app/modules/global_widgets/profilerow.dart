import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

// ignore: must_be_immutable
class ProfileTile extends StatelessWidget {
  final String? text;
  final String? path;

  const ProfileTile({super.key, this.text, this.path});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          path!,
          width: 24, // Adjust size as needed
          height: 24,
        ),
        const SizedBox(width: 8), // Space between icon and text
        Expanded(
          child: CustomText(
            text: text!,
            size: 16,
            weight: FontWeight.w600,
            color: const Color.fromRGBO(4, 54, 61, 1),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Color.fromRGBO(4, 54, 61, 1),
          size: 20,
        )
      ],
    );
  }
}
