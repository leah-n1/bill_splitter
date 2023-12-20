import 'package:get/get.dart';

import '../../../../data/model/transactions.dart';

class BillSplitterOptionsController extends GetxController {
  RxList<Transaction> transactions = <Transaction>[].obs;
  RxList<bool> selectedTransactions = <bool>[].obs;

//  @override
//   void onInit() {
//     super.onInit();
//     fetchDataFromApi();
//   }

  // void fetchDataFromApi() async {
  //   // Simulate API call to fetch transactions
  //   await Future.delayed(const Duration(seconds: 2), () {
  //     List<Transaction> apiTransactions = [
  //       Transaction(id: 1, description: 'Transaction 1'),
  //       Transaction(id: 2, description: 'Transaction 2'),
  //       // Add more transactions as needed
  //     ];

  //     transactions.assignAll(apiTransactions);
  //     // Initialize the selectedItems list with false values
  //     selectedTransactions.assignAll(List<bool>.filled(apiTransactions.length, false));
  //   });
  // }

  void setSelectedIndex(int index) {
    // Toggle the value
    selectedTransactions[index] = !selectedTransactions[index];
    update(); // Manually update to notify observers
  }
}
