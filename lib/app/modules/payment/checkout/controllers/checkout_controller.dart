import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController

  RxInt count = 1.obs;

  void increment(int fundersNumber) {
    if (count.value < fundersNumber * 0.4) {
      count += 1;
    }
  }

  void decrement() {
    if (count.value > 1) {
      count -= 1;
    }
  }
}
