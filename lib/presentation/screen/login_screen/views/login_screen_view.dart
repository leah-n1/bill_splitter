import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/routes/app_pages.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginScreenView'),
        centerTitle: true,
      ),
      body: Obx(() => Center(
            child: InkWell(
              onTap: () {
                controller.fetchProfile();
                // Get.toNamed(Routes.HOME);
              },
              child: Text(
                'LoginScreenView is working ${controller.numOneFriend.value}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          )),
    );
  }
}
