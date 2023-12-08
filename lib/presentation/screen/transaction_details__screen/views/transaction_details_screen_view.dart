import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/presentation/app_colors.dart';

import '../controllers/transaction_details_screen_controller.dart';

class TransactionDetailsScreenView
    extends GetView<TransactionDetailsScreenController> {
  const TransactionDetailsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBase,
        title: const Text('Transactions', style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
        centerTitle: false,
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
