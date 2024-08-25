import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/my_property_details_controller.dart';

class MyPropertyDetailsView extends GetView<MyPropertyDetailsController> {
  const MyPropertyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: CustomText(
            text: "Property details",
            size: 20,
            weight: FontWeight.w600,
          ),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: controller.fetchPropertyDetails(args["my_propery_id"]),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset('assets/loading.json',
                      width: 100, height: 100),
                );
              }
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 354,
                            height: 213,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        snapshot.data!.property.images[0]))),
                          ),
                          Positioned(
                            left: 10,
                            top: 12,
                            child: Container(
                              width: 61,
                              height: 27,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(4, 54, 61, 0.7)),
                              child: Center(
                                child: CustomText(
                                  text: "Rented",
                                  color: Colors.white,
                                  size: 12,
                                  weight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomText(
                          text: snapshot.data!.property.description,
                          size: 20,
                          weight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: 324,
                        height: 223,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(242, 243, 234, 1))),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                height: 72,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: const Border(
                                        bottom: BorderSide(
                                            width: 1.5,
                                            color: Color.fromRGBO(
                                                242, 243, 234, 1)))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "Property price",
                                    ),
                                    CustomText(
                                      text: snapshot.data!.propertyPrice,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Annualised return",
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text: snapshot.data!.annualisedReturn,
                                    size: 14,
                                    weight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Current evaluation",
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text:
                                        "${snapshot.data!.currentEvaluation} EGP",
                                    size: 14,
                                    weight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Current gross rent",
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text:
                                        "${snapshot.data!.currentRent} EGP/month",
                                    size: 14,
                                    weight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Total rental income",
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text:
                                        "${snapshot.data!.annualisedReturn} EGP",
                                    size: 14,
                                    weight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.PROPERTY_DETAILS),
                        child: const Button(
                          text: "View property details",
                          isBorder: true,
                          width: 324,
                          height: 40,
                          buttonColor: Colors.white,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "My Investment",
                            size: 20,
                            weight: FontWeight.w700,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // My investment
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 314,
                            height: 318,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1,
                                    color: const Color.fromRGBO(
                                        242, 243, 234, 1))),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1.5,
                                              color: Color.fromRGBO(
                                                  242, 243, 234, 1)))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Invested amount",
                                        size: 16,
                                        weight: FontWeight.w400,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/investment_amount.svg"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CustomText(
                                            text:
                                                "${snapshot.data!.investedAmount} EGP",
                                            size: 16,
                                            weight: FontWeight.w700,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1.5,
                                              color: Color.fromRGBO(
                                                  242, 243, 234, 1)))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Investment value",
                                        size: 16,
                                        weight: FontWeight.w400,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/investment_value.svg"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CustomText(
                                            text:
                                                "${snapshot.data!.investmentValue} EGP",
                                            size: 16,
                                            weight: FontWeight.w700,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1.5,
                                              color: Color.fromRGBO(
                                                  242, 243, 234, 1)))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "My owner ship",
                                        size: 16,
                                        weight: FontWeight.w400,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/my_ownership.svg"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CustomText(
                                            text:
                                                "${snapshot.data!.myOwnership} %",
                                            size: 16,
                                            weight: FontWeight.w700,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1.5,
                                              color: Color.fromRGBO(
                                                  242, 243, 234, 1)))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Projected net yield",
                                        size: 16,
                                        weight: FontWeight.w400,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/projected_net_yield.svg"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CustomText(
                                            text:
                                                "${snapshot.data!.myOwnership} %",
                                            size: 16,
                                            weight: FontWeight.w700,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "My rented payment",
                            size: 20,
                            weight: FontWeight.w700,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // My investment
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 314,
                            height: 243,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1,
                                    color: const Color.fromRGBO(
                                        242, 243, 234, 1))),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1.5,
                                              color: Color.fromRGBO(
                                                  242, 243, 234, 1)))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Total rent received",
                                        size: 16,
                                        weight: FontWeight.w400,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/rent_recieved.svg"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CustomText(
                                            text:
                                                "${snapshot.data!.totalRentReceived} EGP",
                                            size: 16,
                                            weight: FontWeight.w700,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1.5,
                                              color: Color.fromRGBO(
                                                  242, 243, 234, 1)))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "The last payment",
                                        size: 16,
                                        weight: FontWeight.w400,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/last_payment.svg"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CustomText(
                                            text:
                                                "${snapshot.data!.theLastPayment} EGP",
                                            size: 16,
                                            weight: FontWeight.w700,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1.5,
                                              color: Color.fromRGBO(
                                                  242, 243, 234, 1)))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Expected next payment",
                                        size: 16,
                                        weight: FontWeight.w400,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/wallet_assets/next_payment.svg"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CustomText(
                                            text:
                                                "${snapshot.data!.expectedNextPayment} EGP",
                                            size: 16,
                                            weight: FontWeight.w700,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
