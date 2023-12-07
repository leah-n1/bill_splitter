import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/paybills_screen_controller.dart';

class PaybillsScreenView extends GetView<PaybillsScreenController> {
  const PaybillsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaybillsScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaybillsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
