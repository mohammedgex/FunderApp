import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

// ignore: must_be_immutable
class SearchFilterBox extends StatelessWidget {
  double width;
  double height;
  Color color;
  String? text;
  Color? text_Color;

  SearchFilterBox(
      {super.key,
      this.color = Colors.white,
      this.text_Color,
      this.text,
      this.height = 36,
      this.width = 101});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          border:
              Border.all(width: 1, color: const Color.fromRGBO(4, 54, 61, 1)),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Center(
        child: CustomText(
          text: text,
          size: 16,
          weight: FontWeight.w400,
          color: text_Color,
        ),
      ),
    );
  }
}
