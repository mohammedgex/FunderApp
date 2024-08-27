import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/Favorite_Unit.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/favorite_Screen/controllers/favorite_screen_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FavoriteScreenView extends GetView<FavoriteScreenController> {
  final FavoriteScreenController favoriteController =
      Get.put(FavoriteScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Favorites".tr,
                weight: FontWeight.w600,
                size: 20,
              ),
              GestureDetector(
                onTap: () {
                  controller.clear_Favorites();
                },
                child: CustomText(
                  text: "clear all".tr,
                  weight: FontWeight.w400,
                  size: 12,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: FutureBuilder(
            future: favoriteController.get_favortes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset('assets/loading.json',
                      width: 100, height: 100),
                );
              } else if (snapshot.data!.isEmpty) {
                return Center(
                  child: CustomText(
                    text: "NO DATA".tr,
                  ),
                );
              }
              return ListView.separated(
                itemCount: snapshot.data!.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FavoriteUnit(
                    propert_Location:
                        snapshot.data![index].property.locationString,
                    id: snapshot.data![index].id,
                    propert_Price:
                        snapshot.data![index].property.purchasePrice.toString(),
                    propert_Title: snapshot.data![index].property.name,
                    image_url: snapshot.data![index].property.images[0],
                    status: snapshot.data![index].property.status ?? "avaiable",
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              );
            }),
      ),
    );
  }
}
