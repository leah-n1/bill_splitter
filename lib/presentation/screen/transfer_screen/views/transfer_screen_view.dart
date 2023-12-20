import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transfer_screen_controller.dart';

class TransferScreenView extends GetView<TransferScreenController> {
  const TransferScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TransferScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
