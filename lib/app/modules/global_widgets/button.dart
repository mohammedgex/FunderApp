import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      this.buttonColor,
      this.isBorder = false,
      this.text,
      this.height = 50,
      this.width = 110});
  final String? text;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    String fontFamily =
        Get.locale?.languageCode == 'ar' ? 'Tajawal-Regular' : 'Lato';
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(14),
          border: isBorder
              ? Border.all(
                  width: 1, color: const Color.fromRGBO(236, 138, 35, 1))
              : null),
      child: Center(
          child: Text(
        text!,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color:
                isBorder ? const Color.fromRGBO(236, 138, 35, 1) : Colors.white,
            fontFamily: fontFamily),
      )),
    );
  }
}
