import 'dart:convert';

import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/wallet/wallet_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class WalletScreenController extends GetxController {
  final box = GetStorage();
  static const String URL = ApiUrls.Wallet_api;

// property api
  Future<wallet_model> walletApi() async {
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
      final Map<String, dynamic> data = jsonDecode(response.body);
      print("data $data");
      return wallet_model.fromJson(data);
    } else {
      throw Exception('Failed to load wallet data');
    }
  }
}
