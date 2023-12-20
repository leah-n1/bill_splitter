import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invest_screen_controller.dart';

class InvestScreenView extends GetView<InvestScreenController> {
  const InvestScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvestScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InvestScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
