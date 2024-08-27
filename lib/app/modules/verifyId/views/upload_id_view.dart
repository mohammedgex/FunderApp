import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/verifyId/controllers/verify_id_controller.dart';
import 'package:get/get.dart';

class UploadIdView extends GetView<VerifyIdController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Upload your Passport".tr,
                size: 24,
                weight: FontWeight.w700,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: "Front Side".tr,
                      size: 20,
                      weight: FontWeight.w500,
                    ),
                    Obx(() => GestureDetector(
                        onTap: () {
                          controller.PickfrontSide();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: controller
                                          .frontSide!.value.path.isEmpty
                                      ? const AssetImage("assets/upload.jpg")
                                      : FileImage(controller.frontSide!.value)
                                          as ImageProvider)),
                        )))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Back Side".tr,
                      size: 20,
                      weight: FontWeight.w500,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () {
                            controller.PickbackSide();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: controller
                                            .backSide!.value.path.isEmpty
                                        ? const AssetImage("assets/upload.jpg")
                                        : FileImage(controller.backSide!.value)
                                            as ImageProvider)),
                          ),
                        ))
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () async {
                    await controller.UPLOADID(context);
                  },
                  child: Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Color.fromRGBO(236, 138, 35, 1),
                            ),
                          )
                        : Center(
                            child: Button(
                              width: double.infinity,
                              text: "Next".tr,
                              buttonColor:
                                  const Color.fromRGBO(236, 138, 35, 1),
                            ),
                          ),
                  ))
            ],
          ),
        )));
  }
}
