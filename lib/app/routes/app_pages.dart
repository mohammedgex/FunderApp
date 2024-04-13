import 'package:funder_app/app/modules/Auth/forget_password/bindings/forget_password_binding.dart';
import 'package:funder_app/app/modules/home/navigated_screens/profile_Screen/bindings/profile_screen_binding.dart';
import 'package:funder_app/app/modules/home/navigated_screens/profile_Screen/views/personal_details_view.dart';
import 'package:funder_app/app/modules/home/navigated_screens/profile_Screen/views/profile_screen_view.dart';
import 'package:get/get.dart';
import 'package:funder_app/app/modules/home/mainPage/bindings/main_page_binding.dart';
import 'package:funder_app/app/modules/home/mainPage/views/main_page_view.dart';
import 'package:funder_app/app/modules/home/Property_Details/bindings/property_details_binding.dart';
import 'package:funder_app/app/modules/home/Property_Details/views/property_details_view.dart';
import 'package:funder_app/app/modules/home/navigated_screens/Search_Filter/bindings/search_filter_binding.dart';
import 'package:funder_app/app/modules/home/navigated_screens/Search_Filter/views/search_filter_view.dart';
import 'package:funder_app/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:funder_app/app/modules/onboarding/views/onboarding.dart';
import 'package:funder_app/app/modules/Auth/login/bindings/login_binding.dart';
import 'package:funder_app/app/modules/Auth/forget_password/views/creat_password_view.dart';
import 'package:funder_app/app/modules/Auth/forget_password/views/forget_password_view.dart';
import 'package:funder_app/app/modules/Auth/login/views/login_view.dart';
import 'package:funder_app/app/modules/Auth/login/views/otp_widget_view.dart';
import 'package:funder_app/app/modules/Auth/signup/bindings/signup_binding.dart';
import 'package:funder_app/app/modules/Auth/signup/views/signup_view.dart';
import 'package:funder_app/app/modules/verifyId/bindings/verify_id_binding.dart';
import 'package:funder_app/app/modules/verifyId/views/select_type_view.dart';
import 'package:funder_app/app/modules/verifyId/views/upload_id_view.dart';
import 'package:funder_app/app/modules/verifyId/views/verify_id_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const MAIN = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.PERSONALDETAILS_PAGE,
      page: () => const PersonalDetails(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => OnboardingView(),
      binding: onboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.FOGETPASSWORD,
      page: () => ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CREATPASSWORD,
      page: () => creatPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CREATOTP,
      page: () => OtpWidgetView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_ID,
      page: () => VerifyIdView(),
      binding: VerifyIdBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_ID,
      page: () => UploadIdView(),
      binding: VerifyIdBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_TYPE,
      page: () => SelectType(),
      binding: VerifyIdBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => MainPageView(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_FILTER,
      page: () => SearchFilterView(),
      binding: SearchFilterBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_DETAILS,
      page: () => PropertyDetailsView(),
      binding: PropertyDetailsBinding(),
    ),
  ];
}
