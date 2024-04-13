import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFilterController extends GetxController {
  //TODO: Implement SearchFilterController

  final Is_Selected_type = 0.obs;
  final Is_Selected_pay = 0.obs;

  final Rx<RangeValues> curentRangeValue = RangeValues(1000, 100000).obs;

  final list = ["House", "Villa", "Room"];
  final list2 = ["Rent", "Buy"];

  void select_Type(int index) {
    Is_Selected_type.value = index;
    print("select : ${Is_Selected_type.value}");
  }

  void select_Pay(int index) {
    Is_Selected_pay.value = index;
    print("select : ${Is_Selected_pay.value}");
  }

  void sliderValues(RangeValues values) {
    curentRangeValue.value = values;
  }

  void clearAll() {
    Is_Selected_type.value = 0;
    Is_Selected_pay.value = 0;
    curentRangeValue.value = const RangeValues(1000, 100000);
  }
}
