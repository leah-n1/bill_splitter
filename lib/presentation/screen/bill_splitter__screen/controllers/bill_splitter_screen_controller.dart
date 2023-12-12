


import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BillSplitterScreenController extends GetxController {
  RxList<String> divider = ['Evenly', 'Manually'].obs;
  RxInt selectedDivider = 0.obs;
  RxDouble sliderValue = 0.0.obs;
  RxInt numberOfpayees = 2.obs;
  RxDouble amount= 0.00.obs;
  final subtotalController= TextEditingController(text: "50.00").obs;
  final amountController=TextEditingController(text:"1000.00").obs;


  

  void updateSelectedDivider(int index) {
      selectedDivider.value = index;
      if (index == 1) {
        subtotalController.value.text = '0.00';
      } else {
        subtotalController.value.text = '100.00';
      }
    }
  
    

  void updateSlider({required numofpayees}) {
    double sliderPercentage = 100 /numberOfpayees.toDouble();
   if (selectedDivider.value == 0){
    sliderValue.value= sliderPercentage;
      }
    update();

    //  else
    // (sliderValue[index].value = sliderPercentage);
    // refresh();
  }


  void calculateSubtotal({required  amount, required int numberOfPayees}) {
    // if (numberOfPayees == 0) {
    // return;
    // }
  double subtotal = amount / numberOfPayees.toDouble();
  print('subtotal $subtotal ${selectedDivider.value}');
  // return subtotal;
  if (selectedDivider.value == 0) {
        subtotalController.value.text = subtotal.toString();
      } 
  //else {
  //       subtotalController.value.text = '100.00';
  //     }
  update();
  }

}
