import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String? text;
  Color? color;
  double? size;
  FontWeight? weight;
  bool? Underline;
  bool? ellipsis;
  bool? cenetr;
  CustomText(
      {super.key,
      this.text,
      this.color,
      this.cenetr = false,
      this.size,
      this.weight,
      this.ellipsis = false,
      this.Underline = false});

  @override
  Widget build(BuildContext context) {
    String fontFamily =
        Get.locale?.languageCode == 'ar' ? 'Tajawal-Regular' : 'Lato';
    return Text(
      softWrap: true,
      text!,
      textAlign: cenetr! ? TextAlign.center : null,
      overflow: ellipsis! ? TextOverflow.clip : TextOverflow.visible,
      style: TextStyle(
          decoration:
              Underline! ? TextDecoration.underline : TextDecoration.none,
          color: color,
          fontFamily: fontFamily,
          fontSize: size,
          fontWeight: weight),
    );
  }
}
