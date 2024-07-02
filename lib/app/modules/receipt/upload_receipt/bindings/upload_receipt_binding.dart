import 'package:get/get.dart';

import '../controllers/upload_receipt_controller.dart';

class UploadReceiptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadReceiptController>(
      () => UploadReceiptController(),
    );
  }
}
