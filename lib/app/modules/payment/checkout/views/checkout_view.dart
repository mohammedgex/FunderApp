import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  final args = Get.arguments;

  CheckoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Check out".tr,
            size: 20,
            weight: FontWeight.w600,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: const Color.fromRGBO(
                                              136, 136, 136, 1)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: GestureDetector(
                                    onTap: () => controller.decrement(args[3]),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  width: 165,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: const Color.fromRGBO(
                                              136, 136, 136, 1)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: "${controller.count.value}",
                                        size: 16,
                                        weight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: const Color.fromRGBO(
                                              136, 136, 136, 1)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: GestureDetector(
                                    onTap: () => controller.increment(args[3]),
                                    child: const Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => controller.isOvered.value
                        ? const SizedBox()
                        : Center(
                            child: CustomText(
                              text: "shares number (max 40% of shares)".tr,
                              size: 14,
                              weight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Price Details".tr,
                        size: 20,
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          width: 324,
                          height: 126,
                          decoration: BoxDecoration(
                              border: const Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(4, 54, 61, 1)),
                              ),
                              borderRadius: BorderRadius.circular(14)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Property Price".tr,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text:
                                        "${NumberFormat('#,###').format(args[1])} EGP",
                                    size: 13,
                                    weight: FontWeight.w400,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "price per share".tr,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text:
                                        "${NumberFormat('#,###').format(args[2])}  EGP",
                                    size: 13,
                                    weight: FontWeight.w400,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "total shares cost".tr,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  Obx(() => CustomText(
                                        text:
                                            "${NumberFormat('#,###').format(args[2] * controller.count.value)}  EGP",
                                        size: 13,
                                        weight: FontWeight.w400,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: SizedBox(
                      width: 324,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "deposit".tr,
                            size: 14,
                            weight: FontWeight.w700,
                          ),
                          Obx(() => CustomText(
                                text:
                                    "${NumberFormat('#,###').format((5000 * controller.count.value))} EGP",
                                size: 13,
                                weight: FontWeight.w700,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.PAYMENT_METHODS,
                    arguments: [controller.count.value, /* id */ args[0]]),
                child: Button(
                  width: 216,
                  height: 50,
                  text: "Continue".tr,
                  buttonColor: const Color.fromRGBO(236, 138, 35, 1),
                ),
              )
            ],
          ),
        ));
  }
}
