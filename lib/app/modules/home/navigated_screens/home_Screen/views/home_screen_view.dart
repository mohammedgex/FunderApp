import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/propertiyUnit.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/home_Screen/controllers/home_screen_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  final HomeScreenController Home_Controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                    width: 96,
                    height: 24,
                    "https://s3-alpha-sig.figma.com/img/5e9c/756c/2b95c8b369d75bc5f11f97015797a299?Expires=1713139200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dEbKxoxcdlVoXCTeDfqNNcPgpBKPVhTygnhiye9a-4PjKeBmVvJk1HRxEPltk56BdC5VxQI9O~0oQic3v7R2IhM0rMlyMVXdONRg2kqchCx8r~6~hgv5nSWTOjfR~aWGVePUvKrGXN9uau15gGA1jm6nHAbLhD0YzuIpZ17FidoX2KgUvakGUjeyMWzn2XTZ1yLEOo9X08boz~uqekhmVfMPOLcB-qNpTCkVuJ-LRc5CAr2gcavB9HeYzxJiRR-liT0lWZhMIRI6j~x5rsCc8Isv8Fe-rDld77GAr9IszqDoCUHcH8WDq7hTuzfFzGR-eyaN5NgMaopnX49HCXiE-Q__"),
                SvgPicture.asset("assets/icons/notification.svg")
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(171, 171, 171, 0.08),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                            spreadRadius: 0),
                      ], borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Container(
                        width: 268,
                        height: 48,
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.SEARCH_FILTER),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                                icon: SvgPicture.asset(
                                    "assets/icons/search_Icon 2.svg"),
                                disabledBorder: null,
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                hoverColor: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset("assets/icons/filter.svg")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 138,
                        height: 45,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(236, 138, 35, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: CustomText(
                            text: "Available",
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 138,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(236, 138, 35, 1)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: CustomText(
                            text: "Exited",
                            size: 16,
                            color: const Color.fromRGBO(236, 138, 35, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Our Properties ",
                      weight: FontWeight.w700,
                      size: 20,
                    ),
                    CustomText(
                      text: "See all",
                      weight: FontWeight.w400,
                      size: 14,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 600,
                  padding: const EdgeInsets.all(12),
                  child: FutureBuilder(
                      future: Home_Controller.get_properties(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CustomText(
                              text: "Loading",
                            ),
                          );
                        }
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return PropertiyUnit(
                                propert_Location:
                                    snapshot.data![index].locationString,
                                id: snapshot.data![index].id,
                                controller: Home_Controller,
                                propert_Price: snapshot
                                    .data![index].purchasePrice
                                    .toString(),
                                propert_Title: snapshot.data![index].name,
                                image_url: snapshot.data![index].images[0],
                              );
                            });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Resent listing",
                      weight: FontWeight.w700,
                      size: 20,
                    ),
                    CustomText(
                      text: "See all",
                      weight: FontWeight.w400,
                      size: 14,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 600,
                  padding: const EdgeInsets.all(12),
                  child: FutureBuilder(
                      future: Home_Controller.get_properties(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CustomText(
                              text: "Loading",
                            ),
                          );
                        }
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return PropertiyUnit(
                                propert_Location:
                                    snapshot.data![index].locationString,
                                id: snapshot.data![index].id,
                                controller: Home_Controller,
                                propert_Price: snapshot
                                    .data![index].purchasePrice
                                    .toString(),
                                propert_Title: snapshot.data![index].name,
                                image_url: snapshot.data![index].images[0],
                              );
                            });
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
