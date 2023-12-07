import 'package:get/get.dart';

import '../controllers/manage_budget_screen_controller.dart';

class ManageBudgetScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageBudgetScreenController>(
      () => ManageBudgetScreenController(),
    );
  }
}
