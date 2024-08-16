import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/searchFilterBox.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:searchfield/searchfield.dart';
import '../controllers/search_filter_controller.dart';

class SearchFilterView extends GetView<SearchFilterController> {
  SearchFilterController location_controller = SearchFilterController();
  SearchFilterView({this.searchText});
  String? searchText;

  @override
  Widget build(BuildContext context) {
    final Page_controller = Get.put(SearchFilterController());
    print("searchTExxxxxt $searchText");
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(
                    text: "Filter",
                    size: 20,
                    weight: FontWeight.w600,
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Page_controller.clearAll();
                  location_controller.locationController.clear();
                },
                child: CustomText(
                  text: "clear all",
                  size: 12,
                  weight: FontWeight.w400,
                ),
              )
            ],
          ),
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(
                "assets/icons/exit.svg",
                width: 30,
                height: 30,
              ),
            ),
          ),
        ),
        body: FutureBuilder(
            future: controller.fetchLocations(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset('assets/loading.json',
                      width: 100, height: 100),
                );
              }
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Property type",
                          size: 20,
                          weight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                                3,
                                (index) => GestureDetector(
                                      onTap: () =>
                                          Page_controller.select_Type(index),
                                      child: Obx(() => SearchFilterBox(
                                            text: SearchFilterController()
                                                .list[index],
                                            color: Page_controller
                                                        .Is_Selected_type ==
                                                    index
                                                ? const Color.fromRGBO(
                                                    4, 54, 61, 1)
                                                : Colors.white,
                                            text_Color: Page_controller
                                                        .Is_Selected_type ==
                                                    index
                                                ? Colors.white
                                                : const Color.fromRGBO(
                                                    4, 54, 61, 1),
                                          )),
                                    ))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: "Location",
                          size: 20,
                          weight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.04),
                                blurRadius: 24,
                                offset: Offset(0, 4),
                                spreadRadius: 0)
                          ]),
                          child: SearchField(
                              searchStyle: const TextStyle(
                                  fontSize: 16, fontFamily: "Lato"),
                              controller: controller.locationController,
                              hint: "share selected areas in properties",
                              suggestionsDecoration: SuggestionDecoration(
                                  elevation: 0.2,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12)),
                              searchInputDecoration: const InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(115, 115, 115, 1),
                                    fontWeight: FontWeight.w400),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              suggestions: controller.Properties_locations.map(
                                  (e) => SearchFieldListItem(e,
                                      child: CustomText(
                                        text: e,
                                        size: 16,
                                        weight: FontWeight.w500,
                                      ))).toList()),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.SEARCH_RESULTS,
                          arguments: [
                            "$searchText",
                            "${controller.locationController.text}",
                            1
                          ]),
                      child: const Button(
                        text: "Apply",
                        width: 216,
                        buttonColor: Color.fromRGBO(236, 138, 35, 1),
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
