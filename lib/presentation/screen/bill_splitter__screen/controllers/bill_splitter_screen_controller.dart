import 'package:get/get.dart';

class BillSplitterScreenController extends GetxController {
 RxInt selectedDivider = 0.obs;

 void updateSelectedDivider(int index) {
    selectedDivider.value = index;
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



  

