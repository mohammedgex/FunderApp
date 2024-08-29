// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/property_details/TimeLineTile.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/home_Screen/controllers/home_screen_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/property_details_controller.dart';

class PropertyDetailsView extends GetView<PropertyDetailsController> {
  // controller
  PageController control = PageController();

  // passed data
  dynamic Property_Details = Get.arguments;

  final isArabic = Get.locale?.languageCode == 'ar';

  PropertyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // slider years
    int years = 1;
    return Scaffold(
        body: FutureBuilder(
            future: controller.DetailsApi(Property_Details["propertyId"]),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset('assets/loading.json',
                      width: 100, height: 100),
                );
              }
              if (snapshot.connectionState == ConnectionState.none) {
                return const Text("No data");
              }

              double calculateProgress() {
                if (snapshot.data!.funderCount == 0) return 0.0;
                // Avoid division by zero
                return snapshot.data!.funders!.length /
                    snapshot.data!.funderCount!
                        .toDouble(); // Calculate progress, e.g., 5 / 12
              }

              print(
                  "IS YEAR : ${controller.isYear(snapshot.data!.fundedDate!)}");

              return SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(children: [
                        SizedBox(
                          width: double.infinity,
                          height: 257,
                          child: PageView.builder(
                              physics: const BouncingScrollPhysics(),
                              controller: control,
                              itemCount: snapshot.data!.images!.length < 6
                                  ? snapshot.data!.images!.length
                                  : 6,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: double.infinity,
                                  height: 275,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "${ApiUrls.URl}/uploads/${snapshot.data!.images![index]}")),
                                      borderRadius: BorderRadius.circular(12)),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
                              GestureDetector(
                                  onTap: () => HomeScreenController()
                                      .addtofavorite(
                                          snapshot.data!.id!, context),
                                  child: SvgPicture.asset(
                                      "assets/icons/favoGround.svg")),
                            ],
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 15,
                      ),
                      SmoothPageIndicator(
                        controller: control,
                        count: snapshot.data!.images!.length < 6
                            ? snapshot.data!.images!.length
                            : 6,
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
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: CustomText(
                                    text: "${snapshot.data!.name}",
                                    weight: FontWeight.w600,
                                    ellipsis: true,
                                    size: 16,
                                  ),
                                ),
                                CustomText(
                                  text: "${snapshot.data!.propertyPrice} EGP",
                                  size: 16,
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              cenetr: true,
                              text: "${snapshot.data!.description}",
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: 304,
                              child: LinearProgressIndicator(
                                value: calculateProgress(),
                                backgroundColor:
                                    const Color.fromRGBO(21, 174, 73, 1),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color.fromRGBO(189, 32, 44, 1)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CustomText(
                                      text:
                                          "${snapshot.data!.funders!.length}/${snapshot.data!.funderCount}",
                                    ),
                                    const SizedBox(
                                      width: 1.8,
                                    ),
                                    CustomText(
                                      text: "Funded".tr,
                                    ),
                                  ]),
                                  CustomText(
                                    text: snapshot.data!.status == "sold out"
                                        ? "Sold in ${DateFormat('MMMM').format(DateTime.parse(snapshot.data!.fundedDate.toString()))} ${DateTime.parse(snapshot.data!.fundedDate.toString()).year}"
                                        : "",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 270,
                              height: 98,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  color: Color.fromRGBO(243, 243, 243, 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: snapshot.data!.status! ==
                                                  "sold out".tr
                                              ? "estimated Annual return".tr
                                              : "Funded date".tr,
                                        ),
                                        CustomText(
                                          text: snapshot.data!.status! ==
                                                  "sold out"
                                              ? "${snapshot.data!.estimatedAnnualisedReturn}%"
                                              : "${snapshot.data!.fundedDate}",
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: snapshot.data!.status! ==
                                                  "sold out"
                                              ? "estimated Annual appreciation"
                                                  .tr
                                              : "Purchase price".tr,
                                        ),
                                        CustomText(
                                          text: snapshot.data!.status! ==
                                                  "sold out"
                                              ? "${snapshot.data!.estimatedAnnualAppreciation}%"
                                              : "${snapshot.data!.purchasePrice} EGP",
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: snapshot.data!.status! ==
                                                  "sold out"
                                              ? "estimated projected gross yield"
                                                  .tr
                                              : "Rental income paid".tr,
                                        ),
                                        CustomText(
                                          text: snapshot.data!.status! ==
                                                  "sold out"
                                              ? "${snapshot.data!.estimatedProjectedGrossYield}%"
                                              : "${snapshot.data!.currentRent} EGP",
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
                                          color:
                                              Color.fromRGBO(242, 243, 234, 1)),
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(
                                              242, 243, 234, 1))),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  snapshot.data!.status! == "sold out"
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/icons/Home.svg"),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  size: 15,
                                                  weight: FontWeight.w500,
                                                  text: "Rented",
                                                ),
                                                SizedBox(
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
                                        )
                                      : const SizedBox(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                          "assets/icons/currentRent.svg"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            size: 13.5,
                                            ellipsis: true,
                                            weight: FontWeight.w500,
                                            text:
                                                "Current rent ${snapshot.data!.currentRent} EGP per month",
                                          ),
                                          SizedBox(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                          "assets/icons/annual_gross.svg"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            size: 15,
                                            weight: FontWeight.w500,
                                            text:
                                                "${snapshot.data!.percent}% annual gross yield",
                                          ),
                                          SizedBox(
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
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: isArabic
                                    ? MainAxisAlignment.spaceBetween
                                    : MainAxisAlignment.spaceBetween,
                                children: isArabic
                                    ? [
                                        CustomText(
                                          text: "Location".tr,
                                          size: 20,
                                          color: const Color.fromRGBO(
                                              4, 54, 61, 1),
                                          weight: FontWeight.w600,
                                        ),
                                        CustomText(
                                          text: "See on Map".tr,
                                          size: 14,
                                          color: const Color.fromRGBO(
                                              4, 54, 61, 1),
                                          weight: FontWeight.w400,
                                          Underline: true,
                                        ),
                                      ]
                                    : [
                                        CustomText(
                                          text: "See on Map".tr,
                                          size: 14,
                                          color: const Color.fromRGBO(
                                              4, 54, 61, 1),
                                          weight: FontWeight.w400,
                                          Underline: true,
                                        ),
                                        CustomText(
                                          text: "Location".tr,
                                          size: 20,
                                          color: const Color.fromRGBO(
                                              4, 54, 61, 1),
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
                              ),
                              child: FlutterMap(
                                options: MapOptions(
                                    initialCenter: LatLng(
                                        snapshot.data!.location!.latitude!,
                                        snapshot.data!.location!.longitude!),
                                    initialZoom: 15),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    userAgentPackageName: 'com.example.app',
                                  ),
                                  CircleLayer(
                                    circles: [
                                      CircleMarker(
                                        point: LatLng(
                                            snapshot.data!.location!.latitude!,
                                            snapshot.data!.location!
                                                .longitude!), // center of 't Gooi
                                        radius: 50,
                                        useRadiusInMeter: true,
                                        color: Colors.red.withOpacity(0.3),
                                        borderColor:
                                            Colors.red.withOpacity(0.7),
                                        borderStrokeWidth: 2,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Financials".tr,
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
                                          color:
                                              Color.fromRGBO(242, 243, 234, 1)),
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(
                                              242, 243, 234, 1))),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        size: 14,
                                        weight: FontWeight.w400,
                                        text: "Property Price".tr,
                                      ),
                                      CustomText(
                                        size: 15,
                                        weight: FontWeight.w700,
                                        text:
                                            "${snapshot.data!.propertyPrice} EGP",
                                      ),
                                    ],
                                  ),
                                  snapshot.data!.status == "available"
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              size: 14,
                                              weight: FontWeight.w400,
                                              text: "Transaction Costs".tr,
                                            ),
                                            CustomText(
                                              text:
                                                  "${snapshot.data!.serviceCharge} EGP",
                                              size: 15,
                                              weight: FontWeight.w700,
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                          CustomText(
                            text: "Investment calculator".tr,
                            size: 20,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Initial Investment".tr,
                                  size: 14,
                                  weight: FontWeight.w600,
                                  color: const Color.fromRGBO(148, 148, 148, 1),
                                ),
                                Obx(() => CustomText(
                                      text:
                                          "${controller.investment_value.value.toInt()} EGP",
                                      size: 15,
                                      weight: FontWeight.w700,
                                    )),
                              ],
                            ),
                            Obx(
                              () => Slider(
                                divisions: 100,
                                label: controller.investment_value.value
                                    .toInt()
                                    .toString(),
                                activeColor:
                                    const Color.fromRGBO(85, 198, 90, 1),
                                value: controller.investment_value.value,
                                onChanged: (value) {
                                  controller.calculateTotalValueGrowth(
                                      int.parse(snapshot.data!
                                              .estimatedAnnualAppreciation!)
                                          .toDouble(),
                                      years);
                                  controller.investment_value.value = value;
                                  // controller.calculateTotalValueGrowth(
                                  //     snapshot.data.estimatedAnnualAppreciation, years);
                                },
                                min: 0,
                                max: 100000,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "property value growth years".tr,
                                  size: 14,
                                  weight: FontWeight.w600,
                                  color: const Color.fromRGBO(148, 148, 148, 1),
                                ),
                                Obx(() => CustomText(
                                      text:
                                          "${controller.yield_value.value.toInt()} Years",
                                      size: 15,
                                      weight: FontWeight.w700,
                                    ))
                              ],
                            ),
                            Obx(
                              () => Slider(
                                label: controller.yield_value.value.toString(),
                                activeColor:
                                    const Color.fromRGBO(85, 198, 90, 1),
                                value: controller.yield_value.value,
                                onChanged: (value) {
                                  years = value.toInt();
                                  controller.calculateTotalValueGrowth(
                                      int.parse(snapshot.data!
                                              .estimatedAnnualAppreciation!)
                                          .toDouble(),
                                      value.toInt());
                                  controller.yield_value.value = value;
                                },
                                min: 0,
                                max: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "Projected investment return of".tr,
                        size: 20,
                        weight: FontWeight.w400,
                        color: const Color.fromRGBO(148, 148, 148, 1),
                      ),
                      Obx(() => CustomText(
                            text:
                                "EGP ${controller.investment_value.value.toInt()} in ${controller.yield_value.value.toInt()} years",
                            size: 20,
                            weight: FontWeight.w600,
                            color: const Color.fromRGBO(4, 54, 61, 1),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 375,
                        height: 75,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(242, 243, 234, 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(() => Container(
                                  padding: const EdgeInsets.all(6),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            size: 15,
                                          ),
                                          CustomText(
                                            text: "Investment".tr,
                                            size: 12,
                                            color: const Color.fromRGBO(
                                                148, 148, 148, 1),
                                          )
                                        ],
                                      ),
                                      CustomText(
                                        text:
                                            "${controller.investment_value.value.toInt()}",
                                        size: 14,
                                        weight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                )),
                            Obx(() => Container(
                                  padding: const EdgeInsets.all(6),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            size: 15,
                                            color:
                                                Color.fromRGBO(189, 32, 44, 1),
                                          ),
                                          CustomText(
                                            text: "Value growth".tr,
                                            size: 12,
                                            color: const Color.fromRGBO(
                                                148, 148, 148, 1),
                                          )
                                        ],
                                      ),
                                      CustomText(
                                        text:
                                            "${controller.valueGrowth.value.toInt()}",
                                        size: 14,
                                        weight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                      // Funding timeline
                      Container(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: snapshot.data!.status == "sold out"
                                  ? "Upcoming rental payment"
                                  : "Funding timeline".tr,
                              size: 20,
                              weight: FontWeight.w600,
                            ),
                            snapshot.data!.timelines!.isEmpty &&
                                    snapshot.data!.timelines!.length < 3
                                ? CustomText(
                                    text: "There is no funding timelines",
                                    size: 18,
                                  )
                                : snapshot.data!.status == "sold out"
                                    ? Container(
                                        width: double.infinity,
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Column(
                                          children: [
                                            PropertyTimeLineTile(
                                              isFirst: true,
                                              isLast: false,
                                              isPayRents: true,
                                              DateText: DateFormat(
                                                      'd MMMM yyyy')
                                                  .format(
                                                      DateFormat('yyyy-MM-dd')
                                                          .parse(snapshot
                                                              .data!
                                                              .timelines![0]
                                                              .date
                                                              .toString())),
                                              DateDetails:
                                                  "${snapshot.data!.timelines![0].description}",
                                              DateTitle:
                                                  "${snapshot.data!.timelines![0].title}",
                                            ),
                                            PropertyTimeLineTile(
                                              isFirst: false,
                                              isLast: false,
                                              isPayRents: true,
                                              DateText: DateFormat(
                                                      'd MMMM yyyy')
                                                  .format(
                                                      DateFormat('yyyy-MM-dd')
                                                          .parse(snapshot
                                                              .data!
                                                              .timelines![1]
                                                              .date
                                                              .toString())),
                                              DateDetails:
                                                  "${snapshot.data!.timelines![1].description}",
                                              DateTitle:
                                                  "${snapshot.data!.timelines![1].title}",
                                            ),
                                            PropertyTimeLineTile(
                                              isFirst: false,
                                              isLast: true,
                                              isPayRents: true,
                                              DateText: DateFormat(
                                                      'd MMMM yyyy')
                                                  .format(
                                                      DateFormat('yyyy-MM-dd')
                                                          .parse(snapshot
                                                              .data!
                                                              .timelines![2]
                                                              .date
                                                              .toString())),
                                              DateDetails:
                                                  "${snapshot.data!.timelines![2].description}",
                                              DateTitle:
                                                  "${snapshot.data!.timelines![2].title}",
                                            ),
                                          ],
                                        ),
                                      )
                                    // ===========
                                    : Container(
                                        width: double.infinity,
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Column(
                                          children: [
                                            PropertyTimeLineTile(
                                              isFirst: true,
                                              isLast: false,
                                              isPayRents: false,
                                              DateText: DateFormat(
                                                      'd MMMM yyyy')
                                                  .format(
                                                      DateFormat('yyyy-MM-dd')
                                                          .parse(snapshot
                                                              .data!
                                                              .timelines![0]
                                                              .date
                                                              .toString())),
                                              DateDetails:
                                                  "${snapshot.data!.timelines![0].description}",
                                              DateTitle:
                                                  "${snapshot.data!.timelines![0].title}",
                                            ),
                                            PropertyTimeLineTile(
                                              isFirst: false,
                                              isLast: false,
                                              isPayRents: false,
                                              DateText: DateFormat(
                                                      'd MMMM yyyy')
                                                  .format(
                                                      DateFormat('yyyy-MM-dd')
                                                          .parse(snapshot
                                                              .data!
                                                              .timelines![1]
                                                              .date
                                                              .toString())),
                                              DateDetails:
                                                  "${snapshot.data!.timelines![1].description}",
                                              DateTitle:
                                                  "${snapshot.data!.timelines![1].title}",
                                            ),
                                            PropertyTimeLineTile(
                                              isFirst: false,
                                              isLast: true,
                                              isPayRents: false,
                                              DateText: DateFormat(
                                                      'd MMMM yyyy')
                                                  .format(
                                                      DateFormat('yyyy-MM-dd')
                                                          .parse(snapshot
                                                              .data!
                                                              .timelines![2]
                                                              .date
                                                              .toString())),
                                              DateDetails:
                                                  "${snapshot.data!.timelines![2].description}",
                                              DateTitle:
                                                  "${snapshot.data!.timelines![2].title}",
                                            ),
                                          ],
                                        ),
                                      )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.CHECKOUT, arguments: [
                              snapshot.data!.id,
                              snapshot.data!.propertyPriceTotal,
                              snapshot.data!.propertyPrice,
                              snapshot.data!.funderCount
                            ]);
                          },
                          child: controller.isYear(snapshot.data!.fundedDate!)
                              ? GestureDetector(
                                  onTap: () {
                                    controller.submitSale(snapshot.data!.id!);
                                  },
                                  child: Button(
                                    width: 212,
                                    text: "sell your share".tr,
                                    buttonColor:
                                        const Color.fromRGBO(236, 138, 35, 1),
                                  ),
                                )
                              : snapshot.data!.funders!.length >=
                                      snapshot.data!.funderCount!
                                  ? const SizedBox()
                                  : Button(
                                      width: 212,
                                      text: "Book a share".tr,
                                      buttonColor:
                                          const Color.fromRGBO(236, 138, 35, 1),
                                    ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
