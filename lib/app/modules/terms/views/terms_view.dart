import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/termUnit.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/terms_controller.dart';

class TermsView extends GetView<TermsController> {
  const TermsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: controller.fetchTerms(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset('assets/loading.json',
                      width: 100, height: 100),
                );
              }

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: "Terms & conditions".tr,
                        size: 32,
                        weight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 500,
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return TermUnit(
                                  title: snapshot.data![index].title,
                                  index: index,
                                  description:
                                      snapshot.data![index].description,
                                );
                              }))
                    ],
                  ),
                ),
              );
            }));
  }
}
