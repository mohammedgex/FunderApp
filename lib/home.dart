import 'package:flutter/cupertino.dart';
import 'package:funder_app/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Obx(() => GetMaterialApp(
          title: "Funder",
          debugShowCheckedModeBanner: false,
          initialRoute: controller.value.value
              ? controller.isSignedIn.value == true
                  ? AppPages.MAIN
                  : AppPages.LOGIN
              : AppPages.INITIAL,
          getPages: AppPages.routes,
        ));
  }
}
