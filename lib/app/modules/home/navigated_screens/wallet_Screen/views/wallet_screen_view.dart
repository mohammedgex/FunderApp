import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

import 'package:get/get.dart';

import '../controllers/wallet_screen_controller.dart';

class WalletScreenView extends GetView<WalletScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "MY Wallet",
            size: 20,
            weight: FontWeight.w600,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Investments",
                      size: 16,
                      weight: FontWeight.w400,
                    ),
                    CustomText(
                      text: "AED100000",
                      size: 16,
                      color: const Color.fromRGBO(236, 138, 35, 1),
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              // Key financials
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Key financials",
                    size: 20,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          width: 150,
                          height: 87,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: const Border(
                                bottom:
                                    BorderSide(width: 0.5, color: Colors.black),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                      "assets/wallet_assets/income.svg"),
                                  Container(
                                    child: CustomText(
                                      ellipsis: true,
                                      size: 14,
                                      weight: FontWeight.w500,
                                      text: "Monthly income",
                                      color: Color.fromRGBO(4, 54, 61, 1),
                                    ),
                                  )
                                ],
                              ),
                              CustomText(
                                text: "AED 1.99",
                                size: 14,
                                weight: FontWeight.w700,
                                color: Color.fromRGBO(4, 54, 61, 1),
                              ),
                              CustomText(
                                text: "NOV2023",
                                color: Color.fromRGBO(4, 54, 61, 1),
                                size: 10,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  ),
                ],
              ),
              // Quick Insights
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Quick Insights",
                    size: 20,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          width: 150,
                          height: 87,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: const Border(
                                bottom:
                                    BorderSide(width: 0.5, color: Colors.black),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                      "assets/wallet_assets/income.svg"),
                                  Container(
                                    child: CustomText(
                                      ellipsis: true,
                                      size: 14,
                                      weight: FontWeight.w500,
                                      text: "Monthly income",
                                      color: Color.fromRGBO(4, 54, 61, 1),
                                    ),
                                  )
                                ],
                              ),
                              CustomText(
                                text: "AED 1.99",
                                size: 14,
                                weight: FontWeight.w700,
                                color: Color.fromRGBO(4, 54, 61, 1),
                              ),
                              CustomText(
                                text: "NOV2023",
                                color: Color.fromRGBO(4, 54, 61, 1),
                                size: 10,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  ),
                ],
              ),
              // Receipts
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Receipts",
                    size: 20,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          width: 150,
                          height: 87,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: const Border(
                                bottom:
                                    BorderSide(width: 0.5, color: Colors.black),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                      "assets/wallet_assets/income.svg"),
                                  Container(
                                    child: CustomText(
                                      ellipsis: true,
                                      size: 14,
                                      weight: FontWeight.w500,
                                      text: "Monthly income",
                                      color: Color.fromRGBO(4, 54, 61, 1),
                                    ),
                                  )
                                ],
                              ),
                              CustomText(
                                text: "AED 1.99",
                                size: 14,
                                weight: FontWeight.w700,
                                color: Color.fromRGBO(4, 54, 61, 1),
                              ),
                              CustomText(
                                text: "NOV2023",
                                color: Color.fromRGBO(4, 54, 61, 1),
                                size: 10,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  ),
                ],
              ),

              const Center(
                child: Column(
                  children: [
                    Button(
                      width: 244,
                      text: "My properties",
                      buttonColor: Color.fromRGBO(236, 138, 35, 1),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Button(
                      width: 244,
                      isBorder: true,
                      text: "Buy Properties",
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
