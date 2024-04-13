import 'package:get/get.dart';

import '../controllers/property_details_controller.dart';

class PropertyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyDetailsController>(
      () => PropertyDetailsController(),
    );
  }
}
