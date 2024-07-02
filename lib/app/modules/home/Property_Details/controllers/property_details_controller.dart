import 'dart:convert';
import 'dart:math';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/property_detailsmodel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PropertyDetailsController extends GetxController {
  // calculator values
  // var startValue = 1000.0.obs;
  // var endValue = 100000.0.obs;
  // var numOfYearsStart = 1.0.obs;
  // var numOfYearsEnd = 20.0.obs;

  var investment_value = 1000.0.obs;
  var yield_value = 1.0.obs;
  var valueGrowth = 0.0.obs;

  // init local storage
  final box = GetStorage();

  // api url
  static const String URL = ApiUrls.Properties_api;

  // api connect
  Future<property_detailsmodel> DetailsApi(int id) async {
    final response = await http.get(
      Uri.parse("${URL}/$id"),
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
    double totalValue = investment_value * pow(1 + annualAppreciation, years);

    // Calculate the total value growth
    double totalValueGrowth = totalValue - investment_value.value;

    valueGrowth.value = totalValueGrowth;
  }
}


/* 
total value growth = (initial investment ( 1 + annual appreciation )^years ) - initial investment

*/