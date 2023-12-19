import 'package:get/get.dart';

import '../controllers/bill_splitter_manuallly_screen_controller.dart';

class BillSplitterManualllyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillSplitterManualllyScreenController>(
      () => BillSplitterManualllyScreenController(),
    );
  }
}
