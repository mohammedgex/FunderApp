import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/receipt_textfield.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:get/get.dart';
import '../controllers/upload_receipt_controller.dart';

class UploadReceiptView extends GetView<UploadReceiptController> {
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print("ARGS IS ${args[0]} == ${args[1]} == ${args[2]}");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Upload receipt",
            size: 20,
            weight: FontWeight.w600,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  CustomText(
                    text: "Confirm the deposit",
                    size: 24,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() => GestureDetector(
                      onTap: () {
                        controller.PickreceiptImage();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: controller
                                        .receiptImage!.value.path.isEmpty
                                    ? const AssetImage("assets/upload.jpg")
                                    : FileImage(controller.receiptImage!.value)
                                        as ImageProvider)),
                      ))),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "reference number",
                      size: 16,
                      weight: FontWeight.w400,
                    ),
                    receiptTextField(
                      hintText: "eg1234",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: "Deposit date",
                      size: 16,
                      weight: FontWeight.w400,
                    ),
                    receiptTextField(
                      hintText: "1/1/2023",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: "Deposited amount",
                      size: 16,
                      weight: FontWeight.w400,
                    ),
                    receiptTextField(
                      hintText: "Deposit",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              GestureDetector(
                onTap: () async {
                  await controller.ApiReceipt(
                      method: "${args[2]}",
                      receipt_num: controller.receiptNum_Controller.text,
                      desposit_date: controller.despositDate_Controller.text,
                      desposited_amount:
                          controller.despositedAmount_Controller.text,
                      property_id: args[1],
                      countShares: args[0]);
                  Get.defaultDialog(
                      middleText: "",
                      title: "customer support will contact you shortly",
                      titleStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400));
                },
                child: const Button(
                  width: 262,
                  height: 50,
                  text: "Send details",
                  buttonColor: Color.fromRGBO(236, 138, 35, 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
