import 'dart:ffi';

import 'package:get/get.dart';

class BillSplitterScreenController extends GetxController {
  RxInt selectedDivider = 0.obs;
  RxList<RxDouble> sliderValue = List.generate(4, (_) => RxDouble(0.0)).obs;


  void updateSelectedDivider(int index) {
    selectedDivider.value = index;
  }

  void updateSlider(int index, double sliderPercentage) {
    sliderValue[index].value = sliderPercentage;
    refresh();
  }



  getFormattedPercentage(double value) {
     return '${(value).toStringAsFixed(0)}%';

  }
}



   
  




//  final count = 0.obs;

//   get value => null;
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   void increment() => count.value++;

//   void selectValue(int? i) {}



  

