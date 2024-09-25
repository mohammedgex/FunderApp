import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/verifyId/controllers/verify_id_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SelectType extends GetView<VerifyIdController> {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: "Select the type of document you wish to scan".tr,
                    size: 24,
                    weight: FontWeight.w600,
                  ),
                  CustomText(
                    text:
                        "we need to determine if an identity document is authentic and belongs to you"
                            .tr,
                    size: 16,
                    weight: FontWeight.w400,
                    color: const Color.fromRGBO(148, 148, 148, 1),
                  ),
                  const SizedBox(height: 40),
                  Obx(() => _DocumentTypeOption(
                        type: 'passport',
                        isSelected: controller.selectedType.value == 'passport',
                        onTap: () {
                          controller.selectedType.value = 'passport';
                        },
                      )),
                  const SizedBox(height: 15),
                  Obx(() => _DocumentTypeOption(
                        type: 'id',
                        isSelected: controller.selectedType.value == 'id',
                        onTap: () {
                          controller.selectedType.value = 'id';
                        },
                      )),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (controller.selectedType.value.isNotEmpty) {
                    Get.toNamed(Routes.UPLOAD_ID, arguments: {
                      'type': controller.selectedType.value,
                      "id": args["id"],
                      "isUpdate": args["isUpdate"],
                      "frontSide": args["frontSide"],
                      "backSide": args["backSide"],
                    });
                  }
                },
                child: Button(
                  width: double.infinity,
                  text: "Next".tr,
                  buttonColor: const Color.fromRGBO(236, 138, 35, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DocumentTypeOption extends StatelessWidget {
  final String type;
  final bool isSelected;
  final VoidCallback onTap;

  const _DocumentTypeOption({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected
        ? const Color.fromRGBO(236, 138, 35, 1) // Selected color
        : const Color.fromRGBO(4, 54, 61, 1); // Default color

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(12),
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(width: isSelected ? 1.5 : 1, color: borderColor),
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: borderColor.withOpacity(0.1),
                      blurRadius: 4,
                      spreadRadius: 1)
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              type == 'passport' ? "assets/passport.svg" : "assets/id.svg",
              color: isSelected
                  ? const Color.fromRGBO(236, 138, 35, 1)
                  : const Color.fromRGBO(4, 54, 61, 1),
            ),
            const SizedBox(width: 10),
            CustomText(
              text: type == 'passport' ? "Passport".tr : "National ID".tr,
            ),
          ],
        ),
      ),
    );
  }
}
