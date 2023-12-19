import 'dart:io';

import 'package:get/get.dart';
import '../../../../data/model/contact.dart';
import '../../../../data/provider/network/auth_provider.dart';



class ContactsScreenController extends GetxController {
  RxList<Contact> listOfcontacts=<Contact>[].obs;
  RxList<Contact> selectedPayees=<Contact>[].obs;
  RxInt numofPayees=0.obs;


  @override
  void onInit() {
  super.onInit();
    fetchProfile();
    getContacts('https://run.mocky.io/v3/4ac2127e-eedd-4659-b878-14b319fa2b76');
  }
  


fetchProfile() async {
  try {
    List<Contact> returnValue = await getContacts("https://run.mocky.io/v3/4ac2127e-eedd-4659-b878-14b319fa2b76");
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

 selectPayees(Contact payees){
    selectedPayees.add(payees);
     print (selectedPayees);

 }
  

getCountofPayees(){
  numofPayees.value= selectedPayees.length;
 
    print (numofPayees);
  }





  }





  


