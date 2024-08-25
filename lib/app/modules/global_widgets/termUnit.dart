import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

class TermUnit extends StatelessWidget {
  const TermUnit({super.key, this.description, this.title, this.index});

  final String? title;
  final String? description;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "${index! + 1}. $title",
            size: 20,
            weight: FontWeight.w700,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomText(
            text: description,
            size: 14,
            weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
