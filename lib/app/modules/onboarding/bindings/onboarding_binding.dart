import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class onboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
    );
  }
}
