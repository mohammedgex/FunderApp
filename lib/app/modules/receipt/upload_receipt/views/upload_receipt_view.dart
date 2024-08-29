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
    final _formKey = GlobalKey<FormState>(); // Add GlobalKey for Form

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: CustomText(
            text: "Upload receipt".tr,
            size: 20,
            weight: FontWeight.w600,
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: "Confirm the deposit".tr,
                      size: 24,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                                backgroundColor:
                                    const Color.fromRGBO(242, 243, 234, 1),
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(242, 243, 234, 1),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextButton(
                                          onPressed: () {
                                            controller.PickreceiptImageGalary();
                                            Navigator.pop(context);
                                          },
                                          child: CustomText(
                                            text: "Photo Gallery".tr,
                                            size: 18,
                                            cenetr: true,
                                            weight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                236, 138, 35, 1),
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color:
                                            Color.fromRGBO(115, 115, 115, 0.5),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            controller.PickreceiptImageCamera();
                                          },
                                          child: CustomText(
                                            text: "Camera".tr,
                                            size: 18,
                                            cenetr: true,
                                            weight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                236, 138, 35, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
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
                                        : FileImage(
                                                controller.receiptImage!.value)
                                            as ImageProvider)),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "reference number".tr,
                      size: 16,
                      weight: FontWeight.w400,
                    ),
                    receiptTextField(
                      hintText: "1234",
                      controller: controller.receiptNum_Controller,
                      validation: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        }
                        return "This filed can't be empty.";
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: "Deposit date".tr,
                      size: 16,
                      weight: FontWeight.w400,
                    ),
                    receiptTextField(
                      hintText: "1/1/2023",
                      controller: controller.despositDate_Controller,
                      validation: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        }
                        return "This filed can't be empty.";
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: "Deposited amount".tr,
                      size: 16,
                      weight: FontWeight.w400,
                    ),
                    receiptTextField(
                      hintText: "Deposit".tr,
                      controller: controller.despositedAmount_Controller,
                      validation: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        }
                        return "This filed can't be empty.";
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 65,
                ),
                Obx(() => GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await controller.ApiReceipt(
                              method: "${args[2]}", // payment method
                              property_id: args[1], // id
                              context: context,
                              countShares: args[0].toString()); // shares count
                        }
                      },
                      child: controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Color.fromRGBO(236, 138, 35, 1),
                              ),
                            )
                          : Button(
                              width: 262,
                              height: 50,
                              text: "Send details".tr,
                              buttonColor:
                                  const Color.fromRGBO(236, 138, 35, 1),
                            ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
