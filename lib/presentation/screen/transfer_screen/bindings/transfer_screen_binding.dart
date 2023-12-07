import 'package:get/get.dart';

import '../controllers/transfer_screen_controller.dart';

class TransferScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferScreenController>(
      () => TransferScreenController(),
    );
  }
}
