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

    DateTime? lastPressed;

    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        const maxDuration = Duration(seconds: 2);

        if (lastPressed == null || now.difference(lastPressed!) > maxDuration) {
          lastPressed = now;

          // Navigate to the main route on the first back press
          Get.offAllNamed(Routes.MAIN_PAGE);
          return false;
        }

        // Exit the app on the second back press within 2 seconds
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "MY Wallet".tr,
            size: 20,
            weight: FontWeight.w600,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
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
                    padding:
                        const EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // investments value
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Investments".tr,
                                size: 16,
                                weight: FontWeight.w400,
                              ),
                              //  snapshot.data!.myInvestments.toString().isNotEmpty?
                              CustomText(
                                text:
                                    "${NumberFormat('#,###').format(snapshot.data!.myInvestments)} EGP",
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
                              text: "Key financials".tr,
                              size: 20,
                              weight: FontWeight.w700,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/income.svg"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          CustomText(
                                            ellipsis: true,
                                            size: 14,
                                            weight: FontWeight.w500,
                                            text: "Monthly income".tr,
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
                                          )
                                        ],
                                      ),
                                      CustomText(
                                        text:
                                            "${NumberFormat('#,###').format(snapshot.data!.monthlyIncome)} EGP",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/available_balance.svg"),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          CustomText(
                                            ellipsis: true,
                                            size: 14,
                                            weight: FontWeight.w500,
                                            text: "Properties count".tr,
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
                                          )
                                        ],
                                      ),
                                      CustomText(
                                        text:
                                            "${snapshot.data!.numberOfProperties}",
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
                              text: "Quick Insights".tr,
                              size: 20,
                              weight: FontWeight.w700,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/income.svg"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          CustomText(
                                            ellipsis: true,
                                            size: 14,
                                            weight: FontWeight.w500,
                                            text: "deposit".tr,
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
                                          )
                                        ],
                                      ),
                                      CustomText(
                                        text:
                                            "${NumberFormat('#,###').format(snapshot.data!.deposit)} EGP",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/available_balance.svg"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          CustomText(
                                            ellipsis: true,
                                            size: 14,
                                            weight: FontWeight.w500,
                                            text: "annual gross".tr,
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
                                          )
                                        ],
                                      ),
                                      CustomText(
                                        text:
                                            "${snapshot.data!.annualGrossYield}",
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
                              text: "Receipts".tr,
                              size: 20,
                              weight: FontWeight.w700,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.RECEIPTS),
                              child: SizedBox(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: const Border(
                                            bottom: BorderSide(
                                                width: 0.5,
                                                color: Colors.black),
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
                                              CustomText(
                                                ellipsis: true,
                                                size: 14,
                                                weight: FontWeight.w700,
                                                text: "Receipts".tr,
                                                color: const Color.fromRGBO(
                                                    4, 54, 61, 1),
                                              )
                                            ],
                                          ),
                                          CustomText(
                                            text: "${snapshot.data!.receipts}",
                                            size: 14,
                                            weight: FontWeight.w700,
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
                                          ),
                                          CustomText(
                                            text: "$currentMonth $currentYear",
                                            color: const Color.fromRGBO(
                                                4, 54, 61, 1),
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
                            ),
                          ],
                        ),

                        Center(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.MY_INVESTMENTS),
                                child: Button(
                                  width: 244,
                                  text: "My properties".tr,
                                  buttonColor:
                                      const Color.fromRGBO(236, 138, 35, 1),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () => Get.offAllNamed(Routes.MAIN_PAGE),
                                child: Button(
                                  width: 244,
                                  isBorder: true,
                                  text: "Buy Properties".tr,
                                ),
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
      ),
    );
  }
}
