import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../controllers/wallet_screen_controller.dart';

class WalletScreenView extends GetView<WalletScreenController> {
  @override
  Widget build(BuildContext context) {
    WalletScreenController walletController = Get.put(WalletScreenController());
    // get current month and year
    // Get the current date
    DateTime now = DateTime.now();

    // Format the current month as a string
    String currentMonth = DateFormat('MMMM').format(now);

    // Get the current year
    int currentYear = now.year;

    print('Current month: $currentMonth');
    print('Current year: $currentYear');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: CustomText(
          text: "MY Wallet",
          size: 20,
          weight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
              future: walletController.walletApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset('assets/loading.json',
                        width: 100, height: 100),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 25, left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // investments value
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
                              text: "${snapshot.data!.myInvestments} EGP",
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
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: 150,
                                height: 87,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: const Border(
                                      bottom: BorderSide(
                                          width: 0.5, color: Colors.black),
                                    )),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/wallet_assets/income.svg"),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: CustomText(
                                            ellipsis: true,
                                            size: 14,
                                            weight: FontWeight.w500,
                                            text: "Monthly income",
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
                                          ),
                                        )
                                      ],
                                    ),
                                    CustomText(
                                      text:
                                          "${snapshot.data!.monthlyIncome} EGP",
                                      size: 14,
                                      weight: FontWeight.w700,
                                      color: const Color.fromRGBO(4, 54, 61, 1),
                                    ),
                                    CustomText(
                                      text: "$currentMonth $currentYear",
                                      color: const Color.fromRGBO(4, 54, 61, 1),
                                      size: 10,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // ==================================
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: 150,
                                height: 87,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: const Border(
                                      bottom: BorderSide(
                                          width: 0.5, color: Colors.black),
                                    )),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/wallet_assets/available_balance.svg"),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Container(
                                          child: CustomText(
                                            ellipsis: true,
                                            size: 14,
                                            weight: FontWeight.w500,
                                            text: "Properties count",
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
                                          ),
                                        )
                                      ],
                                    ),
                                    CustomText(
                                      text:
                                          "${snapshot.data!.numberOfProperties}",
                                      size: 14,
                                      weight: FontWeight.w700,
                                      color: const Color.fromRGBO(4, 54, 61, 1),
                                    ),
                                    CustomText(
                                      text: "$currentMonth $currentYear",
                                      color: const Color.fromRGBO(4, 54, 61, 1),
                                      size: 10,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: 150,
                                height: 87,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: const Border(
                                      bottom: BorderSide(
                                          width: 0.5, color: Colors.black),
                                    )),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/wallet_assets/income.svg"),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: CustomText(
                                            ellipsis: true,
                                            size: 14,
                                            weight: FontWeight.w500,
                                            text: "deposit",
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
                                          ),
                                        )
                                      ],
                                    ),
                                    CustomText(
                                      text: "${snapshot.data!.deposit} EGP",
                                      size: 14,
                                      weight: FontWeight.w700,
                                      color: const Color.fromRGBO(4, 54, 61, 1),
                                    ),
                                    CustomText(
                                      text: "$currentMonth $currentYear",
                                      color: const Color.fromRGBO(4, 54, 61, 1),
                                      size: 10,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // ==================================
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: 150,
                                height: 87,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: const Border(
                                      bottom: BorderSide(
                                          width: 0.5, color: Colors.black),
                                    )),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/wallet_assets/available_balance.svg"),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: CustomText(
                                            ellipsis: true,
                                            size: 14,
                                            weight: FontWeight.w500,
                                            text: "annual gross",
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
                                          ),
                                        )
                                      ],
                                    ),
                                    CustomText(
                                      text:
                                          "${snapshot.data!.annualGrossYield}",
                                      size: 14,
                                      weight: FontWeight.w700,
                                      color: const Color.fromRGBO(4, 54, 61, 1),
                                    ),
                                    CustomText(
                                      text: "$currentMonth $currentYear",
                                      color: const Color.fromRGBO(4, 54, 61, 1),
                                      size: 10,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.black),
                                      )),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/receipts.svg"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: CustomText(
                                              ellipsis: true,
                                              size: 14,
                                              weight: FontWeight.w700,
                                              text: "Receipts",
                                              color: const Color.fromRGBO(
                                                  4, 54, 61, 1),
                                            ),
                                          )
                                        ],
                                      ),
                                      CustomText(
                                        text: "${snapshot.data!.receipts}",
                                        size: 14,
                                        weight: FontWeight.w700,
                                        color:
                                            const Color.fromRGBO(4, 54, 61, 1),
                                      ),
                                      CustomText(
                                        text: "$currentMonth $currentYear",
                                        color:
                                            const Color.fromRGBO(4, 54, 61, 1),
                                        size: 10,
                                        weight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.MY_INVESTMENTS),
                              child: const Button(
                                width: 244,
                                text: "My properties",
                                buttonColor: Color.fromRGBO(236, 138, 35, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Button(
                              width: 244,
                              isBorder: true,
                              text: "Buy Properties",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),

      // code ..................
    );
  }
}
