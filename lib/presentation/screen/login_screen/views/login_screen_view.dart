import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/routes/app_pages.dart';
import '../../../app_colors.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
                height: 120,
                width: 120,
                child: Image.asset('assets/images/banking_app_logo.png')),
            const SizedBox(height: 12),
            Text('F L U T T E R',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondarydark)),
            Text('CAPITAL BANK',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondarydark)),
            const SizedBox(height: 60),
            const Text('Login',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/fingerprint.png'),
                      const SizedBox(height: 16),
                      const Text('Biometrics Login',
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(width:8),
                Container(
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/username.png'),
                      const SizedBox(height: 16),
                      const Text('Username',
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ]),
      ));
    }
}



 // body: Obx(() => Center(
      //       child: InkWell(
      //         onTap: () {
      //           controller.fetchProfile();
      //           // Get.toNamed(Routes.HOME);
      //         },
      //         child: Text(
      //           'LoginScreenView is working ${controller.numOneFriend.value}',
      //           style: const TextStyle(fontSize: 20),
      //         ),
      //       ),
      //     )),