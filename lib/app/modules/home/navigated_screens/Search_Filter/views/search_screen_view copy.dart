import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/Search_Filter/controllers/search_filter_controller.dart';
import 'package:funder_app/app/modules/home/navigated_screens/Search_Filter/views/search_filter_view.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SearchScreenView extends StatefulWidget {
  const SearchScreenView({super.key});

  @override
  State<SearchScreenView> createState() => _SearchScreenViewState();
}

class _SearchScreenViewState extends State<SearchScreenView> {
  SearchFilterController search_controller = SearchFilterController();
  List<String> searchHistoryList = [];
  String? searchText = "";

  @override
  void initState() {
    search_controller.readHistory();
    searchHistoryList = search_controller.searchHistory;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: CustomText(
          text: "Search",
          size: 20,
          weight: FontWeight.w600,
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
                    child: SizedBox(
                      width: 268,
                      height: 48,
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.SEARCH_FILTER,
                            arguments: ["$searchText"]),
                        child: TextFormField(
                          controller: search_controller.searchController,
                          onChanged: (value) {
                            searchText = value;
                            print(search_controller.Search_Text);
                          },
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
                  GestureDetector(
                      onTap: () {
                        if (search_controller.searchController.text
                            .trim()
                            .isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SearchFilterView(searchText: searchText)),
                          );

                          search_controller.saveHistory(
                              search_controller.searchController.text);
                        }
                      },
                      child: SvgPicture.asset("assets/icons/filter.svg"))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Research Results",
                    size: 14,
                    weight: FontWeight.w500,
                    color: const Color.fromRGBO(61, 61, 61, 1),
                  ),
                  GestureDetector(
                    onTap: () => search_controller.clearAllHist(),
                    child: CustomText(
                      text: "Clear all",
                      size: 12,
                      weight: FontWeight.w400,
                      color: const Color.fromRGBO(136, 136, 136, 1),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              searchHistoryList.isNotEmpty
                  ? Obx(() => SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: searchHistoryList.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/history.svg"),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: CustomText(
                                          text:
                                              searchHistoryList[index].toString(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SvgPicture.asset("assets/icons/exit.svg"),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                        ),
                      ))
                  : CustomText(
                      text: "NO SERACH",
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
