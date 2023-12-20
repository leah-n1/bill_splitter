import 'package:get/get.dart';

import '../controllers/borrow_screen_controller.dart';

class BorrowScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BorrowScreenController>(
      () => BorrowScreenController(),
    );
  }
}
