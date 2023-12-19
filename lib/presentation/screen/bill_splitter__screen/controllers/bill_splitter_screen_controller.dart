import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/data/model/contact.dart';

class BillSplitterScreenController extends GetxController {
  RxList<String> divider = ['Evenly', 'Manually'].obs;
  RxInt selectedDivider = 0.obs;
  RxDouble sliderValue = 0.0.obs;
  RxInt numberOfPayees = 0.obs;
 
  RxDouble percentage = 0.0.obs;
  final subtotalController = TextEditingController(text: "0.00").obs;
  final amountController = TextEditingController(text: "0.00").obs;
  RxBool isevenlyCalculated = false.obs;
  final percentageController = TextEditingController(text: "0%").obs;
  final RxList<Rx<TextEditingController>> subTotalcontroller2 = List.generate(2,(index) => TextEditingController().obs,
  ).obs;


   RxString totalAmount = '0.00'.obs;
   RxList<Contact> listOfPayees=<Contact>[].obs;
   RxInt selectedContacts =0.obs;

  
  
  void updateSelectedDivider(int index) {
    selectedDivider.value = index;
    if (index == 1) {
      subtotalController.value.text = '0.00';
    } else {
      subtotalController.value.text = '0.00';
    }
  }

  void calculateSubtotal(
      {required String amount, required int numberOfPayees}) {
    try {
      if (amount == null || amount.isEmpty) {
        subtotalController.value.text = 'Php 0.00';
        isevenlyCalculated.value = true;
        update();
        return;
      }
      double parsedAmount = double.parse(amount);

      if (selectedDivider.value == 0) {
        double subtotal = parsedAmount / numberOfPayees.toDouble();
        subtotalController.value.text = 'Php ${subtotal.toStringAsFixed(2)}';
        isevenlyCalculated.value = true;
        update();
    
      }
    } catch (e) {
      subtotalController.value.text = '0.00';
      isevenlyCalculated.value = true;
      update();
    }
  }

  void calculatePercentage({String? amount, required int numberOfPayees}) {
    try {
      if (amount == null || amount.isEmpty) {
        percentageController.value.text = '0%';
        update();
        return;
      }
      double parsedAmount = double.parse(amount);
      double subtotal = parsedAmount / numberOfPayees.toDouble();
      double updatedPercentage = (subtotal / parsedAmount) * 100;
      print('percentagesss $updatedPercentage');

      if (selectedDivider.value == 0) {
        isevenlyCalculated.value = true;
        percentageController.value.text =
            '${updatedPercentage.toStringAsFixed(2)}%';

        update();
      }
    } catch (e) {
      percentage.value = 0.00;
      isevenlyCalculated.value = true;
      update();
    }
  }

  void calculateSliderValue({String? amount, required int numberOfPayees}) {
    try {
      if (amount == null || amount.isEmpty) {
        sliderValue.value = 0;
        update();
        return;
      }

      double parsedAmount = double.parse(amount);
      double subtotal = parsedAmount / numberOfPayees.toDouble();
      double updatedSliderValue = (subtotal / parsedAmount) * 100;
      print('slider $updatedSliderValue');

      if (selectedDivider.value == 0) {
        isevenlyCalculated.value = true;
        sliderValue.value = updatedSliderValue;

        update();
      }
    } catch (e) {
      sliderValue.value = 0.00;
      isevenlyCalculated.value = true;
      update();
    }
  }



void calculateSubtotalManually (amount, numberOfPayees) {
 try {
      if (amount == null || amount.isEmpty) {
       subTotalcontroller2.forEach((controller) {
        controller.value.text = '0.00';});
        update();
        return;
      }

      double parsedAmount = double.parse(amount);
      double subtotal = parsedAmount / numberOfPayees.toDouble();
      double updatedSliderValue = (subtotal / parsedAmount) * 100;
      print('slider $updatedSliderValue');

      if (selectedDivider.value == 0) {
        isevenlyCalculated.value = true;
        sliderValue.value = updatedSliderValue;

        update();
      }
    } catch (e) {
      sliderValue.value = 0.00;
      isevenlyCalculated.value = true;
      update();
    }
  }


updateTotalAmount(String input) {
  double parsedAmount=  double.tryParse(input) ?? 0.00;
  totalAmount.value = parsedAmount.toStringAsFixed(2);
  print('total amount $totalAmount');
}






}
