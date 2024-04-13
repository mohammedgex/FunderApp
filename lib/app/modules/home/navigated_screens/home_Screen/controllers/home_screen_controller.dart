import 'dart:convert';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/propertmodel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  final box = GetStorage();
  static const String URL = ApiUrls.Properties_api;
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
        print("Conected");
        final List<dynamic> data = jsonDecode(response.body)["properties"];
        print("data $data");
        properties = data.map((e) => Property_Model.fromJson(e)).toList();
        print("propeties $properties");
      }
    } catch (error) {
      print("error : $error");
    }
    return properties;
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
        Get.defaultDialog(title: "Added");
      } else {
        Get.defaultDialog(title: "Error");
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
