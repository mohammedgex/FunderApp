import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/favoritemodel.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
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
  Future<List> get_favortes() async {
    List<FavoriteModel> favortes = [];
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
        final List<dynamic> data = jsonDecode(response.body)["message"];
        print(data);
        favortes = data.map((e) => FavoriteModel.fromJson(e)).toList();
        print("propeties $favortes");
      }
    } catch (error) {
      print("error : $error");
    }
    return favortes;
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
      if (response.statusCode == 200) {
        Get.defaultDialog(
            barrierDismissible: false,
            onWillPop: () async => await Get.offAllNamed(Routes.MAIN_PAGE),
            title: "",
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/succ_verify.svg"),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: CustomText(
                    text: "Successfully !",
                    color: const Color.fromRGBO(236, 138, 35, 1),
                    size: 20,
                    weight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomText(
                  text: "All favorite propeties has been deleted successfully.",
                  size: 16,
                  cenetr: true,
                  weight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () => Get.offAllNamed(Routes.MAIN_PAGE),
                  child: const Button(
                    width: 252,
                    text: "Continue",
                    buttonColor: Color.fromRGBO(236, 138, 35, 1),
                  ),
                )
              ],
            ));
      }
    } catch (e) {
      print(e);
    }
  }
}
