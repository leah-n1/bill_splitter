import 'dart:io';

import 'package:get/get.dart';
import '../../../../data/model/contact.dart';
import '../../../../data/provider/network/auth_provider.dart';

class ContactsScreenController extends GetxController {
  RxList<Contact> listOfcontacts = <Contact>[].obs;
  RxList<Contact> selectedPayees = <Contact>[].obs;
  RxInt numofPayees = 0.obs;


  @override
  void onInit() {
    super.onInit();
    fetchProfile();
    getContacts('https://run.mocky.io/v3/88395547-651a-4f66-8ead-fac57f2f3646');
  }


   @override
  void onReady() {
    super.onReady();
    fetchProfile();
    getContacts('https://run.mocky.io/v3/88395547-651a-4f66-8ead-fac57f2f3646');
  }


  fetchProfile() async {
    try {
      List<Contact> returnValue = await getContacts(
          'https://run.mocky.io/v3/88395547-651a-4f66-8ead-fac57f2f3646');
      listOfcontacts.value = returnValue;
    } catch (error) {
      print('Error fetching profile: $error');
    }
  }

  Future<List<Contact>> getContacts(String url) async {
    var data = await AuthProvider().getUser(url);
    var response = data.body['user'];
    var contactsData = response['contacts'] as List<dynamic>;

    List<Contact> contacts = contactsData.map((contactsData) {
      return Contact(
        name: contactsData['name'],
        accountNumber: contactsData['accountNumber'],
        // Add other fields if needed
      );
    }).toList();
    print(contacts);

    return contacts;
  }

  selectPayees(Contact payees) {
    // Check if the payee is not already in the list before adding
    if (!selectedPayees.contains(payees)) {
      selectedPayees.add(payees);
      print('selected $selectedPayees');
    } else {
      removePayee(payees);
    }
    update();
  }

  getCountofPayees() {
    numofPayees.value = selectedPayees.length;
    print('num of payees $numofPayees');
    update();
  }


  removePayee (Contact payee){
    final payeeIndex= selectedPayees.indexOf(payee);
    selectedPayees.remove(payee);

 

}
}
