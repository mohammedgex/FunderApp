import 'dart:convert';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/propertmodel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MyInvestmentsController extends GetxController {
  // init local storage
  final box = GetStorage();

  final list = ["Property", "Pending"];
  final Is_Selected_type = 0.obs;

  // api url for my properties
  static const String URL = ApiUrls.MyProperties_api;

  // trogle buttons
  void select_Type(int index) {
    Is_Selected_type.value = index;
    print("select : ${Is_Selected_type.value}");
  }

  // connect api getting my properties
  Future<List> get_MyProperties() async {
    List<Property_Model> myproperties = [];
    try {
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
        print("data $data");

        myproperties = data.map((e) => Property_Model.fromJson(e)).toList();
      }
    } catch (error) {
      print("error : $error");
    }
    return myproperties;
  }

  // connect api getting pending properties
  Future<List> get_MyPendingProperties() async {
    List<Property_Model> myPendingProperties = [];
    try {
      final response = await http.get(
        Uri.parse(URL),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read("userToken")}',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data =
            jsonDecode(response.body)["properties_panding"];

        myPendingProperties =
            data.map((e) => Property_Model.fromJson(e)).toList();
      }
    } catch (error) {
      print("error : $error");
    }
    return myPendingProperties;
  }
}
