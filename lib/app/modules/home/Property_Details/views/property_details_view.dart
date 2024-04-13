// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/property_details/TimeLineTile.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/property_details_controller.dart';

class PropertyDetailsView extends GetView<PropertyDetailsController> {
  PageController control = PageController();

  PropertyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                width: double.infinity,
                height: 257,
                child: PageView.builder(
                    controller: control,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 275,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://assets-global.website-files.com/620ec747459e13c7cf12a39e/625b10a58137b364b18df2ea_iStock-94179607.jpg")),
                            borderRadius: BorderRadius.circular(12)),
                      );
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SvgPicture.asset("assets/icons/share.svg"),
                    const SizedBox(
                      width: 3,
                    ),
                    SvgPicture.asset("assets/icons/favoGround.svg"),
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 15,
            ),
            SmoothPageIndicator(
              controller: control,
              count: 3,
              axisDirection: Axis.horizontal,
              effect: const SlideEffect(
                  spacing: 8.0,
                  radius: 10.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1.5,
                  dotColor: Color.fromRGBO(4, 54, 61, 1),
                  activeDotColor: Color.fromRGBO(4, 54, 61, 1)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "About Home",
                        weight: FontWeight.w600,
                        size: 16,
                      ),
                      CustomText(
                        text: "AED 1.644.00",
                        size: 16,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: """2Bed in Park Heughts ، 2Bein ParkHeughts 2Bein 
        ParkHeughts 2BeiParkHeughts2Bein ParkHeughts""",
                    size: 14,
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 304,
                    child: const LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Color.fromRGBO(189, 32, 44, 1),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(21, 174, 73, 1)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 270,
                    height: 98,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        color: Color.fromRGBO(243, 243, 243, 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Funded date",
                              ),
                              CustomText(
                                text: "7 Apr 2021",
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Purchase price",
                              ),
                              CustomText(
                                text: "AED 10.234.0",
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Rental income paid",
                              ),
                              CustomText(
                                text: "AED 300.567",
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    height: 200,
                    decoration: BoxDecoration(
                        border: const Border(
                            top: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(242, 243, 234, 1)),
                            bottom: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(242, 243, 234, 1))),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/Home.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  size: 15,
                                  weight: FontWeight.w500,
                                  text: "Rented",
                                ),
                                Container(
                                  width: 300 - 50,
                                  child: CustomText(
                                    size: 11,
                                    weight: FontWeight.w400,
                                    text:
                                        "currently occupied and professionally managed by our team",
                                    ellipsis: true,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/currentRent.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  size: 13.5,
                                  ellipsis: true,
                                  weight: FontWeight.w500,
                                  text: "Current rent id ADE 10.000 per month",
                                ),
                                Container(
                                  width: 310 - 50,
                                  child: CustomText(
                                    size: 11,
                                    weight: FontWeight.w400,
                                    text:
                                        "Distributed monthly among all investors after standard charges and fees",
                                    ellipsis: true,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/annual_gross.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  size: 15,
                                  weight: FontWeight.w500,
                                  text: "9% annual gross yield",
                                ),
                                Container(
                                  width: 310 - 50,
                                  child: CustomText(
                                    size: 11,
                                    weight: FontWeight.w400,
                                    text:
                                        "Distributed monthly among all investors after standard charges and fees",
                                    ellipsis: true,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "See on Map",
                          size: 14,
                          color: const Color.fromRGBO(4, 54, 61, 1),
                          weight: FontWeight.w400,
                          Underline: true,
                        ),
                        CustomText(
                          text: "Location",
                          size: 20,
                          color: const Color.fromRGBO(4, 54, 61, 1),
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://geology.com/world/world-map.gif"))),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Financials",
                  size: 20,
                  weight: FontWeight.w600,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 300,
                    height: 90,
                    decoration: BoxDecoration(
                        border: const Border(
                            top: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(242, 243, 234, 1)),
                            bottom: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(242, 243, 234, 1))),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              size: 14,
                              weight: FontWeight.w400,
                              text: "Property Price",
                            ),
                            CustomText(
                              size: 15,
                              weight: FontWeight.w700,
                              text: "AED 1.644.00",
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              size: 14,
                              weight: FontWeight.w400,
                              text: "Transaction Costs",
                            ),
                            CustomText(
                              text: "AED 1.644.00",
                              size: 15,
                              weight: FontWeight.w700,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CustomText(
              text: "Calculator",
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Funding timeline",
                    size: 20,
                    weight: FontWeight.w600,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 15),
                    child: const Column(
                      children: [
                        PropertyTimeLineTile(
                          isFirst: true,
                          isLast: false,
                          DateText: "20 February 2024",
                          DateDetails:
                              "This is a conservative estimate for the closing date ofthe property funding",
                          DateTitle: "Expected closing date",
                        ),
                        PropertyTimeLineTile(
                          isFirst: false,
                          isLast: false,
                          DateText: "20 February 2024",
                          DateDetails:
                              "This is a conservative estimate for the closing date of the property funding",
                          DateTitle:
                              "Holding company created and title  deed distributed",
                        ),
                        PropertyTimeLineTile(
                          isFirst: false,
                          isLast: true,
                          DateText: "20 February 2024",
                          DateDetails:
                              "This is a conservative estimate for the closing date of the property funding",
                          DateTitle: "Expected first rental payment",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
