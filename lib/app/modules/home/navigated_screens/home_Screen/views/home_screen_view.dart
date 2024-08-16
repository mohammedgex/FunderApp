import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/propertiyUnit.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/home_Screen/controllers/home_screen_controller.dart';
import 'package:funder_app/app/modules/home/reset_password/controllers/resetPassword_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  final HomeScreenController Home_Controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/logo.svg",
                  width: 96,
                  height: 24,
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
                  child: SvgPicture.asset(
                    "assets/nonotifi.svg",
                  ),
                )
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(controller.buttons.length, (index) {
                        return GestureDetector(
                            onTap: () => controller.selectButton(index),
                            child: Obx(
                              () => Container(
                                width: 138,
                                height: 45,
                                decoration: BoxDecoration(
                                    border:
                                        controller.is_Selected.value == index
                                            ? null
                                            : Border.all(
                                                width: 1,
                                                color: const Color.fromRGBO(
                                                    236, 138, 35, 1)),
                                    color: controller.is_Selected.value == index
                                        ? const Color.fromRGBO(236, 138, 35, 1)
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Center(
                                  child: CustomText(
                                    text: controller.buttons[index].tr,
                                    size: 16,
                                    color: controller.is_Selected.value == index
                                        ? Colors.white
                                        : const Color.fromRGBO(236, 138, 35, 1),
                                  ),
                                ),
                              ),
                            ));
                      })
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => CustomText(
                        text: controller.is_Selected.value == 0
                            ? "Our Properties".tr
                            : "Funded Properties".tr,
                        weight: FontWeight.w700,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => Container(
                    width: double.infinity,
                    height: 600,
                    padding: const EdgeInsets.all(12),
                    child: FutureBuilder(
                        future: controller.is_Selected.value == 0
                            ? Home_Controller.get_properties()
                            : Home_Controller.Get_SoldOutProperties(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Lottie.asset('assets/loading.json',
                                  width: 100, height: 100),
                            );
                          }
                          return snapshot.data!.isEmpty
                              ? Center(
                                  child: CustomText(
                                    text: "No Properties to show",
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                )
                              : ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return PropertiyUnit(
                                      images: snapshot.data![index].images,
                                      propert_Location:
                                          snapshot.data![index].locationString,
                                      id: snapshot.data![index].id,
                                      controller: Home_Controller,
                                      description:
                                          snapshot.data![index].description,
                                      fundedDate:
                                          snapshot.data![index].fundedDate,
                                      purchasePrice:
                                          snapshot.data![index].purchasePrice,
                                      funderCount:
                                          snapshot.data![index].funderCount,
                                      rentalIncome:
                                          snapshot.data![index].rentalIncome,
                                      currentRent:
                                          snapshot.data![index].currentRent,
                                      percent: snapshot.data![index].percent,
                                      locationString:
                                          snapshot.data![index].locationString,
                                      propertyPriceTotal: snapshot
                                          .data![index].propertyPriceTotal,
                                      propertyPrice:
                                          snapshot.data![index].propertyPrice,
                                      transactionCosts: snapshot
                                          .data![index].transactionCosts,
                                      serviceCharge:
                                          snapshot.data![index].serviceCharge,
                                      status: snapshot.data![index].status,
                                      approved: snapshot.data![index].approved,
                                      propert_Price: snapshot
                                          .data![index].purchasePrice
                                          .toString(),
                                      propert_Title: snapshot.data![index].name,
                                      image_url:
                                          snapshot.data![index].images[0],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                );
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
