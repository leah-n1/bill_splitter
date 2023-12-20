import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/borrow_screen_controller.dart';

class BorrowScreenView extends GetView<BorrowScreenController> {
  const BorrowScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BorrowScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BorrowScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
