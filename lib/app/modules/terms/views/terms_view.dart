import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

import 'package:get/get.dart';

import '../controllers/terms_controller.dart';

class TermsView extends GetView<TermsController> {
  const TermsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TermsView'),
        centerTitle: true,
      ),
      body: Center(
        child: CustomText(
          text: "mklfdnmnfmdf",
        ),
      ),
    );
  }
}
