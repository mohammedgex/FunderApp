import 'package:get/get.dart';

import '../controllers/my_investments_controller.dart';

class MyInvestmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyInvestmentsController>(
      () => MyInvestmentsController(),
    );
  }
}
