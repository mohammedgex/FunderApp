import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/property_detailsmodel.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PropertyDetailsController extends GetxController {
  // calculator values
  // var startValue = 1000.0.obs;
  // var endValue = 100000.0.obs;
  // var numOfYearsStart = 1.0.obs;
  // var numOfYearsEnd = 20.0.obs;

  var investment_value = 100000.0.obs;
  var yield_value = 1.0.obs;
  var valueGrowth = 0.0.obs;

  // init local storage
  final box = GetStorage();

  // api url
  static const String URL = ApiUrls.Properties_api;

  // api connect
  Future<property_detailsmodel> DetailsApi(int id) async {
    final response = await http.get(
      Uri.parse("$URL/$id"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read("userToken")}',
      },
    );

    if (response.statusCode == 200) {
      print("Conected");
      final Map<String, dynamic> data = jsonDecode(response.body)["properties"];
      print("data $data");
      return property_detailsmodel.fromJson(data);
    } else {
      throw Exception('Failed to load wallet data');
    }
  }

  // calculator
  // void calculatevalueGrowth(
  //   int annualappre,
  // ) {
  //   double eq1 = 1.0 + annualappre;
  //   double eq2 = pow(1, 2);
  //   double eq3 = investment_value.value.toDouble() * eq2;
  //   valueGrowth.value = eq3 - investment_value.value.toDouble();
  // }

  //

  void calculateTotalValueGrowth(double annualAppreciation, int years) {
    // Calculate the total value after growth
    double totalValue =
        investment_value * pow(1 + annualAppreciation / 100, years);

    // Calculate the total value growth
    double totalValueGrowth = totalValue - investment_value.value;

    valueGrowth.value = totalValueGrowth;
  }

  bool isYear(String date) {
    DateTime now = DateTime.now();
    DateTime convertedDate = DateTime.parse(date);
    Duration difference = now.difference(convertedDate);
    if (difference.inDays >= 365) {
      return true;
    } else {
      return false;
    }
  }

  var isLoading = false.obs;

  Future<void> submitSale(int propertyId) async {
    try {
      isLoading.value = true;

      final url = Uri.parse(ApiUrls.Sales_api);
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read("userToken")}',
        },
        body: jsonEncode({
          'property_id': propertyId,
        }),
      );

      isLoading.value = false;

      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Handle success
        Get.defaultDialog(
          backgroundColor: Colors.white,
          barrierDismissible: false,
          onWillPop: () async => await Get.offAllNamed(Routes.MAIN_PAGE),
          title: "",
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/succ_verify.svg"),
              const SizedBox(height: 10),
              Center(
                child: CustomText(
                  text: "Success".tr,
                  color: const Color.fromRGBO(4, 54, 61, 1),
                  size: 15,
                  weight: FontWeight.w500,
                ),
              ),
              CustomText(
                text: decodedResponse,
                size: 14,
                cenetr: true,
                weight: FontWeight.w400,
                color: const Color.fromRGBO(148, 148, 148, 1),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => Get.offAllNamed(Routes.MAIN_PAGE),
                child: Button(
                  width: 252,
                  text: "Continue".tr,
                  buttonColor: const Color.fromRGBO(236, 138, 35, 1),
                ),
              ),
            ],
          ),
        );
      } else {
        // Handle error response
        Get.snackbar("Error", decodedResponse['errors'],
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isLoading.value = false;
      // Handle any exception
      Get.snackbar("Exception", "An error occurred: $e",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}


/* 
total value growth = (initial investment ( 1 + annual appreciation )^years ) - initial investment

*/