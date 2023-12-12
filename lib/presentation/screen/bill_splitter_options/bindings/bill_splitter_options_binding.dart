import 'package:get/get.dart';

import '../controllers/bill_splitter_options_controller.dart';

class BillSplitterOptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillSplitterOptionsController>(
      () => BillSplitterOptionsController(),
    );
  }
}
