import 'package:get/get.dart';

import '../controllers/bill_splitter_screen_controller.dart';

class BillSplitterScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillSplitterScreenController>(
      () => BillSplitterScreenController(),
    );
  }
}
