import 'dart:ffi';

import 'package:get/get.dart';

class BillSplitterScreenController extends GetxController {
 RxInt selectedDivider = 0.obs;
 RxDouble sliderValue=20.0.obs;

 void updateSelectedDivider(int index) {
    selectedDivider.value = index;
  }

void updateSlider(double sliderPercentage){
  sliderValue.value = sliderPercentage;
  refresh();
 
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



  

