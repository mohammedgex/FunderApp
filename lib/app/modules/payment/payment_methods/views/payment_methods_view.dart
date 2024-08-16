import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/payment_method.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/payment_methods_controller.dart';

class PaymentMethodsView extends GetView<PaymentMethodsController> {
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
          text: "Payment methods".tr,
          size: 20,
          weight: FontWeight.w600,
        )),
        body: FutureBuilder(
            future: controller.get_paymentMethods(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset('assets/loading.json',
                      width: 100, height: 100),
                );
              }

              return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: ListView.separated(
                      itemCount: snapshot.data!.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () => Get.toNamed(Routes.INSTAPAY, arguments: [
                            "${snapshot.data![index].title}",
                            "There are no third party fees currently",
                            "${snapshot.data![index].description}",
                            args[0], // shares count
                            args[1], // id
                            "${snapshot.data![index].bank}",
                            "${snapshot.data![index].accountNumber}",
                          ]),
                          child: payMethod_widget(
                            payment_name: "${snapshot.data![index].title}",
                            fees: "fess",
                            transfer_way: "Transfer via bank",
                          ),
                        );
                      }),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                    ),
                  )

                  // GestureDetector(
                  //   onTap: () => Get.toNamed(Routes.INSTAPAY, arguments: [
                  //     "Bank transfer",
                  //     "There are no third party fees currently",
                  //     "Open Insta pay application and proceed with transferring the following details.",
                  //     args[0],
                  //     args[1],
                  //   ]),
                  //   child: payMethod_widget(
                  //     payment_name: "Bank transfer",
                  //     fees: "fess",
                  //     transfer_way: "Transfer via bank",
                  //   ),
                  // ),

                  );
            })));
  }
}
