import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
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
    print(args["my_propery_id"]);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: CustomText(
            text: "Property details".tr,
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
              // if (snapshot.connectionState == ConnectionState.none ||
              //     !snapshot.hasData) {
              //   return CustomText(
              //     text: "No details.",
              //   );
              // }

              // Now you can safely access the data with null-aware operators
              final property = snapshot.data!.property;
              final propertyPrice = snapshot.data!.propertyPrice;
              final annualisedReturn = snapshot.data!.annualisedReturn;
              final currentEvaluation = snapshot.data!.currentEvaluation;
              final currentRent = snapshot.data!.currentRent;
              final investedAmount = snapshot.data!.investedAmount;
              final investmentValue = snapshot.data!.investmentValue;
              final myOwnership = snapshot.data!.myOwnership;
              final totalRentReceived = snapshot.data!.totalRentReceived;
              final theLastPayment = snapshot.data!.theLastPayment;
              final expectedNextPayment = snapshot.data!.expectedNextPayment;

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
                                        "${ApiUrls.URl}/uploads/${snapshot.data!.property.images[0]}"))),
                          ),
                          snapshot.data!.currentRent == 0
                              ? Positioned(
                                  left: 10,
                                  top: 12,
                                  child: Container(
                                    width: 61,
                                    height: 27,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color.fromRGBO(
                                            4, 54, 61, 0.7)),
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
                              : const SizedBox()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomText(
                          text: property.description,
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
                                      text: "property_price".tr,
                                    ),
                                    CustomText(
                                      text: "$propertyPrice EGP",
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "annualised_return".tr,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text: "$annualisedReturn %",
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
                                    text: "current_evaluation".tr,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text: "$currentEvaluation EGP",
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
                                    text: "current_rent".tr,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text: "$currentRent EGP/month",
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
                                    text: "total_rent_received".tr,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text:
                                        "${snapshot.data!.property.estimatedProjectedGrossYield} EGP",
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
                        onTap: () => Get.toNamed(
                          Routes.PROPERTY_DETAILS,
                          arguments: {"propertyId": property.id},
                        ),
                        child: Button(
                          text: "View property details".tr,
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
                            text: "My Investment".tr,
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
                                        text: "invested_amount".tr,
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
                                            text: "$investedAmount EGP",
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
                                        text: "investment_value".tr,
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
                                            text: "$investmentValue EGP",
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
                                        text: "my_ownership".tr,
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
                                            text: "$myOwnership %",
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
                                        text: "Projected net yield".tr,
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
                                                "${snapshot.data!.property.estimatedProjectedGrossYield} %",
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
                            text: "My rented payment".tr,
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
                                        text: "total_rent_received".tr,
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
                                            text: "$totalRentReceived EGP",
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
                                        text: "the_last_payment".tr,
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
                                            text: "$theLastPayment EGP",
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
                                        text: "expected_next_payment".tr,
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
                                            text: expectedNextPayment,
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
