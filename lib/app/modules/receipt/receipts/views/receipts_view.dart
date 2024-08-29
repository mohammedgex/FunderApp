import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/receiptUnit.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/receipts_controller.dart';

class ReceiptsView extends GetView<ReceiptsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Receipts".tr,
            size: 20,
            weight: FontWeight.w600,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: FutureBuilder(
              future: controller.get_receipts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset('assets/loading.json',
                        width: 100, height: 100),
                  );
                }
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return receiptUnit(
                      imageUrl: "${snapshot.data![index].image}",
                      amount: "${snapshot.data![index].depositedAmount}",
                      date: "${snapshot.data![index].depositDate}",
                      status: "${snapshot.data![index].status}",
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                );
              },
            ),
          ),
        ));
  }
}
