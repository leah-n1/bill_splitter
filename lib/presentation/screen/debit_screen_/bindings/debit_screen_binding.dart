import 'package:get/get.dart';

import '../controllers/debit_screen_controller.dart';

class DebitScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebitScreenController>(
      () => DebitScreenController(),
    );
  }
}
