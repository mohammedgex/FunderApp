import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/propertmodel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  // init local storage
  final box = GetStorage();
  // api url for properties
  static const String URL = ApiUrls.Properties_api;

  // api url for adding to favorite
  static const String FAVO_URl = ApiUrls.Favorites_api;

  // property api
  Future<List> get_properties() async {
    List<Property_Model> properties = [];
    try {
      print(box.read("userToken"));
      final response = await http.get(
        Uri.parse(URL),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read("userToken")}',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)["properties"];

        properties = data.map((e) => Property_Model.fromJson(e)).toList();
      }
    } catch (error) {
      print("error : $error");
    }
    return properties;
  }

  // property detials calculator
  void calculateTotalValueGrowth(
    int initial_investment,
    int annual_appreciation,
    int years,
  ) {
    int eq1 = 1 + annual_appreciation;
    int eq2 = initial_investment * eq1 * years;
    int eq3 = eq2 - initial_investment;
  }

  // add property to favorite
  Future<void> addtofavorite(int id) async {
    try {
      final response = await http.post(
        Uri.parse("${FAVO_URl}/$id"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read("userToken")}',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        Get.defaultDialog(title: "Added", content: const SizedBox());
      } else if (response.statusCode == 403) {
        Get.defaultDialog(title: "add before", content: const SizedBox());
      }
    } catch (e) {
      print("Error $e");
    }
  }
}