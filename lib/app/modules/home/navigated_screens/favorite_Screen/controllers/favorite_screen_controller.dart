import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/favoritemodel.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class FavoriteScreenController extends GetxController {
  // init local storage
  final box = GetStorage();

  // api url
  static const String URL = ApiUrls.Favorites_api;

  // Api get favorites
  Future<List<FavoriteModel>> get_favorites() async {
    List<FavoriteModel> favorites = [];
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
        final List<dynamic> data = jsonDecode(response.body)["message"];
        favorites = data.map((e) => FavoriteModel.fromJson(e)).toList();
      }
    } catch (error) {
      print("Error: $error");
    }
    return favorites;
  }

  @override
  void onInit() {
    // fetchPropertyDetails(2);
    super.onInit();
  }

  // Api clear all favorites
  void clear_Favorites() async {
    try {
      final response = await http.delete(
        Uri.parse(URL),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read("userToken")}',
        },
      );
      if (response.statusCode == 200) {}
    } catch (e) {
      // print(e);
    }
  }

  // // remove from favorites
  Future<void> removetofavorite(int id, BuildContext context) async {
    try {
      final response = await http.delete(
        Uri.parse("$URL/$id"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read("userToken")}',
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        Get.offAllNamed(Routes.MAIN_PAGE);
      } else if (response.statusCode == 403) {
        Get.defaultDialog(title: "add before", content: const SizedBox());
      }
    } catch (e) {
      // print("Error $e");
    }
  }
}
