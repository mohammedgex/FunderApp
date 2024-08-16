import 'package:flutter/cupertino.dart';
import 'package:funder_app/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:funder_app/translations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final storage = GetStorage();

    // Get the saved locale from storage, or default to English if not found
    Locale savedLocale = Locale(
      storage.read<String>('languageCode') ?? 'en',
      storage.read<String>('countryCode') ?? 'US',
    );

    return Obx(() => GetMaterialApp(
          title: "Funder",
          translations: Translation(),
          debugShowCheckedModeBanner: false,
          initialRoute: controller.value.value
              ? controller.isSignedIn.value == true
                  ? AppPages.MAIN
                  : AppPages.LOGIN
              : AppPages.INITIAL,
          getPages: AppPages.routes,
          locale: savedLocale, // Use the saved locale
          fallbackLocale: const Locale('en', 'US'),
        ));
  }
}
