import 'package:get/get.dart';
import '../../../../data/model/transactions.dart';
import '../views/transaction_details_screen_view.dart';



class TransactionDetailsScreenController extends GetxController {
RxList<Transaction>? listtransactions = <Transaction>[].obs;
 RxSet<TransactionDetailType> selectedType = <TransactionDetailType>{TransactionDetailType.all}.obs;

  void updateSelectedType(Set<TransactionDetailType> newSelection) {
  selectedType.clear();
  selectedType.addAll(newSelection);
    update();
  }

  
}


 


// final count = 0.obs;
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