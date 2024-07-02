import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/propertiyUnit.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/home_Screen/controllers/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/all_properties_controller.dart';

class AllPropertiesView extends GetView<AllPropertiesController> {
  @override
  Widget build(BuildContext context) {
    final HomeScreenController Home_Controller =
        Get.put(HomeScreenController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Our properties",
            size: 20,
            weight: FontWeight.w600,
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(35),
          child: FutureBuilder(
              future: Home_Controller.get_properties(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset('assets/loading.json',
                        width: 100, height: 100),
                  );
                }
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return PropertiyUnit(
                      images: snapshot.data![index].images,
                      propert_Location: snapshot.data![index].locationString,
                      id: snapshot.data![index].id,
                      controller: Home_Controller,
                      description: snapshot.data![index].description,
                      fundedDate: snapshot.data![index].fundedDate,
                      purchasePrice: snapshot.data![index].purchasePrice,
                      funderCount: snapshot.data![index].funderCount,
                      rentalIncome: snapshot.data![index].rentalIncome,
                      currentRent: snapshot.data![index].currentRent,
                      percent: snapshot.data![index].percent,
                      locationString: snapshot.data![index].locationString,
                      propertyPriceTotal:
                          snapshot.data![index].propertyPriceTotal,
                      propertyPrice: snapshot.data![index].propertyPrice,
                      transactionCosts: snapshot.data![index].transactionCosts,
                      serviceCharge: snapshot.data![index].serviceCharge,
                      status: snapshot.data![index].status != null
                          ? snapshot.data![index].status
                          : "null",
                      approved: snapshot.data![index].approved,
                      propert_Price:
                          snapshot.data![index].purchasePrice.toString(),
                      propert_Title: snapshot.data![index].name,
                      image_url: snapshot.data![index].images[0],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                );
              }),
        ));
  }
}
