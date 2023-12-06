import 'package:get/get.dart';

import '../controllers/home_detail_screen_controller.dart';

class HomeDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDetailScreenController>(
      () => HomeDetailScreenController(),
    );
  }
}
