import 'dart:convert';

import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/receipts_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ReceiptsController extends GetxController {
  //TODO: Implement ReceiptsController

  final box = GetStorage();
  static const String URL = ApiUrls.Receipt_api;

  // api connect
  Future<List> get_receipts() async {
    List<receiptsModel> receipts = [];
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
        final List<dynamic> data = jsonDecode(response.body)["receipts"];
        print(data);
        receipts = data.map((e) => receiptsModel.fromJson(e)).toList();
        print("receipts $receipts");
      }
    } catch (error) {
      print("error : $error");
    }
    return receipts;
  }
}
