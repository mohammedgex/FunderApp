import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  // init getStorage box
  final box = GetStorage();
  final value = false.obs;

  @override
  void onInit() {
    value.value = box.read("splash_end") ?? false;
    box.write("splash_end", value.value);
    update();
    super.onInit();
  }

  // onboarding last screen
  final lastPage = false.obs;

  void LastVal(int val) {
    lastPage.value = (val == 2);
  }

  // onboarding DoneButton
  void DoneButton() {
    Get.offNamed(Routes.LOGIN);
    box.write("splash_end", true);
    value.value = box.read("splash_end");
    update();
  }
}
