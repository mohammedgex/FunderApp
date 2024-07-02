import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/receiptUnit.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

import 'package:get/get.dart';

import '../controllers/receipts_controller.dart';

class ReceiptsView extends GetView<ReceiptsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Receipts",
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
                return ListView.separated(
                  itemCount: 15,
                  itemBuilder: ((context, index) {
                    return receiptUnit(
                      imageUrl: "dfdf",
                      amount: "100",
                      date: "11-8-2004",
                      status: "acceted",
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
