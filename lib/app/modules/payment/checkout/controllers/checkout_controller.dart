import 'package:get/get.dart';

class CheckoutController extends GetxController {
  RxInt count = 1.obs;
  RxBool isOvered = true.obs;

  void increment(int fundersNumber) {
    print(isOvered.value);
    if (count.value < fundersNumber * 0.4) {
      count += 1;
      if (count.value == fundersNumber * 0.4) {
        isOvered.value = false;
      }
    } else {
      isOvered.value = false;
    }
  }

  // void chngVal(int fundersNumber) {
  //   if (count.value > fundersNumber * 0.4) {
  //     isOvered.value = false;
  //   }
  //   isOvered.value = true;
  // }

  void decrement(int fundersNumber) {
    print(isOvered.value);

    if (count.value > 1) {
      count -= 1;
      isOvered.value = true;
    }
  }
}
