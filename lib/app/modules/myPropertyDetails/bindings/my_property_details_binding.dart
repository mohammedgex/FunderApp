import 'package:get/get.dart';

import '../controllers/my_property_details_controller.dart';

class MyPropertyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPropertyDetailsController>(
      () => MyPropertyDetailsController(),
    );
  }
}
