import 'package:get/get.dart';

import '../controllers/contacts_screen_controller.dart';

class ContactsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactsScreenController>(
      () => ContactsScreenController(),
    );
  }
}
