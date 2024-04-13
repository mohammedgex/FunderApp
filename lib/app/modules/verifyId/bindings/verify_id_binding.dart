import 'package:get/get.dart';

import '../controllers/verify_id_controller.dart';

class VerifyIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyIdController>(
      () => VerifyIdController(),
    );
  }
}
