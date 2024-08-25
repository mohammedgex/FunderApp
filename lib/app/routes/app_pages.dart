import 'package:funder_app/app/modules/myPropertyDetails/bindings/my_property_details_binding.dart';
import 'package:funder_app/app/modules/myPropertyDetails/views/my_property_details_view.dart';
import 'package:get/get.dart';

import '../modules/Auth/forget_password/bindings/forget_password_binding.dart';
import '../modules/Auth/forget_password/views/creat_password_view.dart';
import '../modules/Auth/forget_password/views/forget_password_view.dart';
import '../modules/Auth/login/bindings/login_binding.dart';
import '../modules/Auth/login/views/login_view.dart';
import '../modules/Auth/login/views/otp_widget_view.dart';
import '../modules/Auth/signup/bindings/signup_binding.dart';
import '../modules/Auth/signup/views/signup_view.dart';
import '../modules/home/Property_Details/bindings/property_details_binding.dart';
import '../modules/home/Property_Details/views/property_details_view.dart';
import '../modules/home/all_properties/bindings/all_properties_binding.dart';
import '../modules/home/all_properties/views/all_properties_view.dart';
import '../modules/home/mainPage/bindings/main_page_binding.dart';
import '../modules/home/mainPage/views/main_page_view.dart';
import '../modules/home/navigated_screens/Search_Filter/bindings/search_filter_binding.dart';
import '../modules/home/navigated_screens/Search_Filter/views/search_filter_view.dart';
import '../modules/home/navigated_screens/Search_Filter/views/search_results_view.dart';
import '../modules/home/navigated_screens/profile_Screen/bindings/profile_screen_binding.dart';
import '../modules/home/navigated_screens/profile_Screen/views/personal_details_view.dart';
import '../modules/home/navigated_screens/profile_Screen/views/profile_screen_view.dart';
import '../modules/home/notifications/bindings/notifications_binding.dart';
import '../modules/home/notifications/views/notifications_view.dart';
import '../modules/home/reset_password/bindings/resetPassword_binding.dart';
import '../modules/home/reset_password/views/resetPassword_view.dart';
import '../modules/myInvestments/bindings/my_investments_binding.dart';
import '../modules/myInvestments/views/my_investments_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding.dart';
import '../modules/payment/checkout/bindings/checkout_binding.dart';
import '../modules/payment/checkout/views/checkout_view.dart';
import '../modules/payment/payment_methods/bindings/payment_methods_binding.dart';
import '../modules/payment/payment_methods/views/insta_pay_view.dart';
import '../modules/payment/payment_methods/views/payment_methods_view.dart';
import '../modules/receipt/receipts/bindings/receipts_binding.dart';
import '../modules/receipt/receipts/views/receipts_view.dart';
import '../modules/receipt/upload_receipt/bindings/upload_receipt_binding.dart';
import '../modules/receipt/upload_receipt/views/upload_receipt_view.dart';

import '../modules/terms/bindings/terms_binding.dart';
import '../modules/terms/views/terms_view.dart';
import '../modules/verifyId/bindings/verify_id_binding.dart';
import '../modules/verifyId/views/select_type_view.dart';
import '../modules/verifyId/views/upload_id_view.dart';
import '../modules/verifyId/views/verify_id_view.dart';

// import '../modules/myPropertyDetails/bindings/my_property_details_binding.dart';
// import '../modules/myPropertyDetails/views/my_property_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const MAIN = Routes.MAIN_PAGE;

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
        transition: Transition.cupertinoDialog),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
        name: _Paths.SEARCH_FILTER,
        page: () => SearchFilterView(),
        binding: SearchFilterBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: _Paths.PROPERTY_DETAILS,
        page: () => PropertyDetailsView(),
        binding: PropertyDetailsBinding(),
        transition: Transition.downToUp),
    GetPage(
      name: _Paths.ALL_PROPERTIES,
      page: () => AllPropertiesView(),
      binding: AllPropertiesBinding(),
    ),
    GetPage(
        name: _Paths.CHECKOUT,
        page: () => CheckoutView(),
        binding: CheckoutBinding(),
        transition: Transition.cupertinoDialog),
    GetPage(
      name: _Paths.PAYMENT_METHODS,
      page: () => PaymentMethodsView(),
      binding: PaymentMethodsBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_RECEIPT,
      page: () => UploadReceiptView(),
      binding: UploadReceiptBinding(),
    ),
    GetPage(
      name: _Paths.INSTAPAY,
      page: () => InstaPayView(),
      binding: PaymentMethodsBinding(),
    ),
    GetPage(
      name: _Paths.MY_INVESTMENTS,
      page: () => MyInvestmentsView(),
      binding: MyInvestmentsBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROPERTY_DETAILS,
      page: () => const MyPropertyDetailsView(),
      binding: MyPropertyDetailsBinding(),
    ),
    GetPage(
        name: _Paths.SEARCH_RESULTS,
        page: () => const SearchResultsView(),
        binding: SearchFilterBinding(),
        transition: Transition.fade),
    GetPage(
        name: _Paths.RECEIPTS,
        page: () => ReceiptsView(),
        binding: ReceiptsBinding(),
        transition: Transition.fade),
    GetPage(
      name: _Paths.TERMS,
      page: () => const TermsView(),
      binding: TermsBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => resetPasswordView(),
      binding: resetPasswordBinding(),
    ),
    GetPage(
        name: _Paths.NOTIFICATIONS,
        page: () => const NotificationsView(),
        binding: NotificationsBinding(),
        transition: Transition.downToUp),
  ];
}
