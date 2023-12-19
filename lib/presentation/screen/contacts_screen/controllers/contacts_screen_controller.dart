import 'package:get/get.dart';
import '../../../../data/model/contact.dart';
import '../../../../data/provider/network/auth_provider.dart';



class ContactsScreenController extends GetxController {
  RxList<Contact> listOfcontacts=<Contact>[].obs;


  @override
  void onInit() {
  super.onInit();
    fetchProfile();
  }
  


fetchProfile() async {
  print('tesdt');
    List<Contact> returnValue = await getContacts(
        "https://run.mocky.io/v3/4ac2127e-eedd-4659-b878-14b319fa2b76");
    listOfcontacts.value = returnValue;
  
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


}
  


