import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/bottom_navigationBar.dart';
import 'package:get/get.dart';
import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.Pages[controller.currentPage.value],
          bottomNavigationBar: bottom_NavigationBar(controller: controller),
        ));
  }
}
