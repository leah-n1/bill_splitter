import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillSplitterScreenController extends GetxController {
  RxList<String> divider = ['Evenly', 'Manually'].obs;
  RxInt selectedDivider = 0.obs;
  RxDouble sliderValue = 0.0.obs;
  RxInt numberOfPayees = 0.obs;
  RxDouble amount = 0.00.obs;
  RxDouble percentage = 0.0.obs; 
  
 
  final subtotalController = TextEditingController(text: "0.00").obs;
  final amountController = TextEditingController(text: "0.00").obs;
  RxBool isevenlyCalculated = false.obs;
  final percentageController= TextEditingController(text:"0%").obs;
  

  




  void updateSelectedDivider(int index) {
    selectedDivider.value = index;
    if (index == 1) {
      subtotalController.value.text = '0.00';
    } else {
      subtotalController.value.text = '0.00';
    }
  }





void calculateSubtotal({required amount, required int numberOfPayees}) {
  var numberOfPayees= 6;
  try {
    // Check if amount is null or empty
    if (amount == null || amount.isEmpty) {
      subtotalController.value.text = 'Php 0.00';
      percentageController.value.text= '0%';
      isevenlyCalculated.value = true;
     update();
      return;
    }
    double parsedAmount = double.parse(amount);
    double subtotal = parsedAmount / numberOfPayees.toDouble();
    print('subtotal $subtotal');


    if (selectedDivider.value == 0) {
      subtotalController.value.text = 'Php ${subtotal.toStringAsFixed(2)}';
      isevenlyCalculated.value = true;
      update();
    }
  } catch (e) {
    // Handle the case where the amount cannot be parsed as a double
    subtotalController.value.text = '0.00';
    isevenlyCalculated.value = true;
    update();
  }
}





void calculatePercentage ({String? amount, required int numberOfPayees}){
  try {
    // Check if amount is null or empty
    if (amount == null || amount.isEmpty) {
      subtotalController.value.text = '0.00';
      percentageController.value.text= '0%';
      isevenlyCalculated.value = true;
      sliderValue.value=0;
     update();
      return;
    }
   double parsedAmount = double.parse(amount);
   double subtotal = parsedAmount / numberOfPayees.toDouble();
   double updatedPercentage = (subtotal/parsedAmount) * 100;
     print('percentage $updatedPercentage');

    if (selectedDivider.value == 0) {
      isevenlyCalculated.value = true;
      percentageController.value.text= '${updatedPercentage.toStringAsFixed(2)}%';
    
       // Set the percentage value
      update();
    }
  } catch (e) {
    // Handle the case where the amount cannot be parsed as an integer
    percentage.value = 0.00;
    isevenlyCalculated.value = true;
  
    update();
  }
}

void calculateSliderValue ({required amount, required int numberOfPayees}){
  
try {
    // Check if amount is null or empty
    if (amount == null || amount.isEmpty) {
      subtotalController.value.text = '0.00';
      percentageController.value.text= '0%';
      isevenlyCalculated.value = true;
      sliderValue.value=0;
     update();
      return;
    }
   double parsedAmount = double.parse(amount);
   double subtotal = parsedAmount / numberOfPayees.toDouble();
   double updatedSliderValue= (subtotal/parsedAmount) * 100;

   
   if (selectedDivider.value == 0) {
      subtotalController.value.text = subtotal.toString();
      isevenlyCalculated.value = true;
      sliderValue.value= updatedSliderValue;

      
       // Set the percentage value
      update();
       print('slider $updatedSliderValue');
    }
  } catch (e) {
    // Handle the case where the amount cannot be parsed as an integer
    sliderValue.value = 0.00;
    isevenlyCalculated.value = true;
  
    update();
  }
}


}