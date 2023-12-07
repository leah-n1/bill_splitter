import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaction_details_screen_controller.dart';

class TransactionDetailsScreenView
    extends GetView<TransactionDetailsScreenController> {
  const TransactionDetailsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransactionDetailsScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TransactionDetailsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
