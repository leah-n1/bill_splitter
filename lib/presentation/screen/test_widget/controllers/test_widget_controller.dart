import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestWidgetController extends GetxController {
   RxDouble amount = 0.0.obs;
  RxDouble percentage = 0.0.obs;
final amountController = TextEditingController(text: "0.00").obs;
final percentageController= TextEditingController(text:"0%").obs;


void updateAmount(double value) {
    amount.value = value;
    amountController.value.text = value.toString();
    update();
  }

  void updatePercentage(double value) {
    percentage.value = value;
    percentageController.value.text = value.toString();
    update();
  }

}
