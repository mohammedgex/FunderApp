import 'package:funder_app/app/modules/home/navigated_screens/favorite_Screen/views/favorite_screen_view.dart';
import 'package:funder_app/app/modules/home/navigated_screens/home_Screen/views/home_screen_view.dart';
import 'package:funder_app/app/modules/home/navigated_screens/profile_Screen/views/profile_screen_view.dart';
import 'package:funder_app/app/modules/home/navigated_screens/wallet_Screen/views/wallet_screen_view.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  final RxList _pages = [
    HomeScreenView(),
    WalletScreenView(),
    FavoriteScreenView(),
    ProfileScreenView()
  ].obs;

  RxInt currentPage = 0.obs;
  List get Pages => _pages;

  void changeIndex(int value) {
    currentPage.value = value;
  }
}
