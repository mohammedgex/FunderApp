import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:get/get.dart';

class appBar extends StatelessWidget {
  const appBar({super.key, this.appBartitle});
  final String? appBartitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: CustomText(
        text: appBartitle,
        size: 20,
        weight: FontWeight.w600,
      ),
      leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back)),
    );
  }
}
