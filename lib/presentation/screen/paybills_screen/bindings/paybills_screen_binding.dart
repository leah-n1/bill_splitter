import 'package:get/get.dart';

import '../controllers/paybills_screen_controller.dart';

class PaybillsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaybillsScreenController>(
      () => PaybillsScreenController(),
    );
  }
}
