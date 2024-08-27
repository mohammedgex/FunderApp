import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/wallet/my_property_detials.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyPropertyDetailsController extends GetxController {
  final box = GetStorage();

  Future<PropertyDetailsModal?> fetchPropertyDetails(int id) async {
    final response = await http.get(
      Uri.parse('${ApiUrls.URl}/api/properties/propertyDetails/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read("userToken")}',
      },
    );

    if (response.statusCode == 200) {
      print("CONNNN ${json.decode(response.body)}");
      return PropertyDetailsModal.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load property details');
    }
  }
}
