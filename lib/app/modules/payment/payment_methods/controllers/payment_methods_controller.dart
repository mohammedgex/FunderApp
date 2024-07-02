import 'dart:convert';

import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/payment_method.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PaymentMethodsController extends GetxController {
  //TODO: Implement PaymentMethodsController

  static const String URL = ApiUrls.Payment_api;
  final box = GetStorage();

  // connect api
  Future<List> get_paymentMethods() async {
    List<paymentMethod_model> paymentMethods = [];
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
        final List<dynamic> data = jsonDecode(response.body)["payments"];
        print(data);
        paymentMethods =
            data.map((e) => paymentMethod_model.fromJson(e)).toList();
        print("receipts $paymentMethods");
      }
    } catch (error) {
      print("error : $error");
    }
    return paymentMethods;
  }
}
