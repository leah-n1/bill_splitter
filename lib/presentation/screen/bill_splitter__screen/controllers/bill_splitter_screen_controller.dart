import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/data/model/contact.dart';
import 'package:get_x/presentation/screen/debit_screen_/controllers/debit_screen_controller.dart';

import '../../contacts_screen/controllers/contacts_screen_controller.dart';

class BillSplitterScreenController extends GetxController {
  DebitScreenController? debitController;
  ContactsScreenController? payeeController;
  RxList<String> divider = ['Evenly', 'Manually'].obs;
  RxString totalAmount = '0.00'.obs;
  RxDouble totalAmounttoSplit = 0.00.obs;
  RxInt selectedDivider = 0.obs;
  RxDouble sliderValue = 0.0.obs;
  RxInt numberOfPayees = 0.obs;
  final amountController = TextEditingController(text: '0.00').obs;
  RxBool isevenlyCalculated = false.obs;
  RxDouble percentage = 0.0.obs;
  RxList<Contact> listOfPayees = <Contact>[].obs;
  RxList<TextEditingController> listOfTextEditingConttoller =
  RxList<TextEditingController>.empty();
  RxInt selectedContacts = 0.obs;
  //final subtotalController = TextEditingController(text: "0.00").obs;
  // final amountController = TextEditingController(text: "0.00").obs;
 
  //final percentageController = TextEditingController(text: "0%").obs;
  // final RxList<Rx<TextEditingController>> subTotalcontroller2 = List.generate(
  //   2,
  //   (index) => TextEditingController().obs,
  // ).obs;

 

  onInit() {
    //payeeController = Get.put(ContactsScreenController());
  }

  void updateSelectedDivider(int index) {
    selectedDivider.value = index;
    // if (index == 1) {
    //   subtotalController.value.text = '0.00';
    // } else {
    //   subtotalController.value.text = '0.00';
    // }
  }

  generateTextEditingController(RxList<Contact> currentContact) {
    List<TextEditingController> tfController = <TextEditingController>[];
    for (var element in currentContact) {
      tfController.add(
        TextEditingController(text: "PHP ${element.amount}"),
      );
    }
    return tfController;
  }

  calculate(String currentAmount, List<Contact> listOfSelectedPayee,
      {bool isEven = true}) {
    if (isEven) {
      double parsedAmount = double.parse(currentAmount);
      double subtotal = parsedAmount / listOfSelectedPayee.length;
      updateListEvenly(subtotal, listOfSelectedPayee, parsedAmount);
      // listOfPayees.value = updatedList;
      //RxList<Contact> updatedRxList = updatedRxList;
      // generateTextEditingController(RxList());
      update();
    } else {}
  }

  updateListEvenly(
      double subtotal, List<Contact> listOfSelectedPayee, double totalAmount) {
    List<Contact> updatedList = <Contact>[];
    List<Contact> updatedListWithPercentage = <Contact>[];

    for (var i = 0; i < listOfSelectedPayee.length; i++) {
      var updatedElement = listOfSelectedPayee[i];
      updatedElement.amount = subtotal;

      updatedList.add(updatedElement);
    }

    var calculatedEachShare =
        calculatePercentageShares(updatedList, totalAmount);

    for (var i = 0; i < listOfSelectedPayee.length; i++) {
      var updatedElement = listOfSelectedPayee[i];
      updatedElement.percentage = calculatedEachShare[i];
      updatedListWithPercentage.add(updatedElement);
    }

    return updatedListWithPercentage;
  }

  List<double> calculatePercentageShares(
      List<Contact> participants, double totalAmount) {
    List<double> percentageShares = [];

    for (var participant in participants) {
      double percentageShare = ((participant.amount ?? 0) / totalAmount) * 100;
      percentageShares.add(percentageShare);
    }

    return percentageShares;
  }

  // void calculateSubtotal(
  //     {required String amount, required int numOfParticipants}) {
  //   try {
  //     if (amount == null || amount.isEmpty) {
  //       subtotalController.value.text = 'Php 0.00';
  //       isevenlyCalculated.value = true;
  //       update();
  //       return;
  //     }
  //     double parsedAmount = double.parse(amount);

  //     if (selectedDivider.value == 0) {
  //       double subtotal = parsedAmount / numOfParticipants.toDouble();
  //       subtotalController.value.text = 'Php ${subtotal.toStringAsFixed(2)}';
  //       isevenlyCalculated.value = true;
  //       update();
  //     }
  //   } catch (e) {
  //     subtotalController.value.text = '0.00';
  //     isevenlyCalculated.value = true;
  //     update();
  //   }
  // }

  // void calculatePercentage({String? amount, required int numberOfPayees}) {
  //   try {
  //     if (amount == null || amount.isEmpty) {
  //       percentageController.value.text = '0%';
  //       update();
  //       return;
  //     }
  //     double parsedAmount = double.parse(amount);
  //     double subtotal = parsedAmount / numberOfPayees.toDouble();
  //     double updatedPercentage = (subtotal / parsedAmount) * 100;
  //     print('percentagesss $updatedPercentage');

  //     if (selectedDivider.value == 0) {
  //       isevenlyCalculated.value = true;
  //       percentageController.value.text =
  //           '${updatedPercentage.toStringAsFixed(2)}%';

  //       update();
  //     }
  //   } catch (e) {
  //     percentage.value = 0.00;
  //     isevenlyCalculated.value = true;
  //     update();
  //   }
  // }

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

  void calculateSubtotalManually(amount, numberOfPayees) {
    try {
      if (amount == null || amount.isEmpty) {
        // subTotalcontroller2.forEach((controller) {
        //   controller.value.text = '0.00';
        // });
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
    double parsedAmount = double.tryParse(input) ?? 0.00;
    totalAmount.value = parsedAmount.toStringAsFixed(2);
    //  amountController.value.text = parsedAmount.toStringAsFixed(2);
    print('total amount $totalAmount');
  }
}
