import 'package:get/get.dart';

import '../controllers/invest_screen_controller.dart';

class InvestScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestScreenController>(
      () => InvestScreenController(),
    );
  }
}
