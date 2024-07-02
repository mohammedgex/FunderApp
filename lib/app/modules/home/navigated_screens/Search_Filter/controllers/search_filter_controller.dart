import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/propertmodel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SearchFilterController extends GetxController {
  // init local storage
  final box = GetStorage();
  // select category
  final Is_Selected_type = 0.obs;
  // search text
  String Search_Text = "";
  // stored search texts
  RxList<String> searchHistory = <String>[].obs;
  // categories
  final list = ["House", "Villa", "Room"];

  // properties locations
  final Properties_locations = RxList<dynamic>();

  // init textfields
  TextEditingController searchController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  // api url
  static const String SEARCH_URl = ApiUrls.Search_api;
  static const String LOCATIONS_URl = ApiUrls.locations_api;

  // when page init
  @override
  void onInit() {
    fetchLocations();
    debugPrint("Hello");
    readHistory();

    super.onInit();
  }

  // select type
  void select_Type(int index) {
    Is_Selected_type.value = index;
    print("select : ${Is_Selected_type.value}");
  }

  // clear all (category and textsearchList)
  void clearAll() {
    Is_Selected_type.value = 0;
    locationController.clear();
  }

  void saveHistory(String searchText) {
    searchHistory.add(searchText);
    box.write("searchHistory",
        searchHistory.toList(growable: false)); // Save as List<String>
  }

  void readHistory() {
    final dynamic savedHistory = box.read("searchHistory");
    if (savedHistory != null && savedHistory is List<dynamic>) {
      searchHistory.value = savedHistory
          .map((dynamic item) => item.toString())
          .toList()
          .cast<String>()
          .obs;
    } else {
      searchHistory
          .clear(); // Clear search history if it's not found or not in the correct format
    }
  }

  void clearAllHist() {
    searchHistory.clear();
    box.write("searchHistory", searchHistory.toList(growable: false));
    readHistory();
  }

  Future<List> SearchApi({String? searchText, String? CateId}) async {
    print("Location ${locationController.text}");
    List<Property_Model> results = [];
    try {
      final response = await http.post(Uri.parse("$SEARCH_URl"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read("userToken")}',
          },
          body: jsonEncode({
            'search': searchText,
            'location': locationController.text.toString(),
            'category[]': CateId
          }));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)["properties"];
        results = data.map((e) => Property_Model.fromJson(e)).toList();
      }
    } catch (e) {
      print("Error $e");
    }
    return results;
  }

  // get locations
  Future<void> fetchLocations() async {
    // Create a GET request with authorization header
    var response = await http.get(
      Uri.parse(LOCATIONS_URl),
      headers: {
        'Authorization': 'Bearer ${box.read("userToken")}',
        'Accept': 'application/json',
      },
    );

    // Check if the response status is successful
    if (response.statusCode == 200) {
      // Parse the JSON response
      var jsonResponse = json.decode(response.body);

      final locations = jsonResponse['locations'];

      // Print locations or use them as needed
      Properties_locations.value = locations;
      print("locations $locations");
    } else {
      print('Failed to fetch locations: ${response.statusCode}');
    }
  }
}
