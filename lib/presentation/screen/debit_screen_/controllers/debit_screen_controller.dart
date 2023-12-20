import 'package:get/get.dart';
import 'package:get_x/data/model/transactions.dart';

import '../../../../data/provider/network/auth_provider.dart';

class DebitScreenController extends GetxController {
  RxList<Transaction> listOfTransactions = <Transaction>[].obs;
  RxList<Transaction> listOfDebitTransactions = <Transaction>[].obs;
  RxList<Transaction>  billtoPay=<Transaction>[].obs;
  RxList<Transaction> selectedBill = <Transaction>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
    getDebitTransactions('Debit');
  }

  @override
  void onReady() {
    super.onReady();
    fetchProfile();
    getDebitTransactions('Debit');
  }

  fetchProfile() async {
    try {
      List<Transaction> returnValue = await getListofTransactions(
          'https://run.mocky.io/v3/88395547-651a-4f66-8ead-fac57f2f3646');
      listOfTransactions.value = returnValue;
    } catch (error) {
      print('Error fetching profile: $error');
    }
  }

  Future<List<Transaction>> getListofTransactions(String url) async {
    var data = await AuthProvider().getUser(url);
    var response = data.body['user'];
    var transactionsData = response['transactions'] as List<dynamic>;

    List<Transaction> transactions = transactionsData.map((transactionsData) {
      return Transaction(
        id: transactionsData['id'],
        amount: transactionsData['amount'],
        date: transactionsData['date'],
        type: transactionsData['type'],
        description: transactionsData['description'],
      );
    }).toList();
    // print(transactions);

    return transactions;
  }

  getDebitTransactions(String type) async {
    List<Transaction> transactions = await getListofTransactions(
      'https://run.mocky.io/v3/88395547-651a-4f66-8ead-fac57f2f3646',
    );

    listOfTransactions.assignAll(transactions);

    List<Transaction> debitTransactions =
        transactions.where((transaction) => transaction.type == type).toList();

    listOfDebitTransactions.assignAll(debitTransactions);
       print(debitTransactions);
  }

selectPayees(Transaction bill) {
    if (!billtoPay.contains(bill)) {
      billtoPay.add(bill);
      print('selected $billtoPay');
    } else {
      removeBill(bill);
    }
    update();
  }

removeBill (Transaction bill){
    final billIndex= selectedBill.indexOf(bill);
    selectedBill.remove(bill);


}
}
