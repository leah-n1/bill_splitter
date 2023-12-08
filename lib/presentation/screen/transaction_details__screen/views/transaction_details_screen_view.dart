import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/presentation/app_colors.dart';
import '../controllers/transaction_details_screen_controller.dart';

enum TransactionDetailType { all, debit, credit }

class TransactionDetailsScreenView
    extends GetView<TransactionDetailsScreenController> {
  final Set<TransactionDetailType> typeTransaction = <TransactionDetailType>{};

  TransactionDetailsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBase,
        title: const Text(
          'Transactions',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              const SizedBox(height: 16),
              SegmentedButton<TransactionDetailType>(
              segments: const <ButtonSegment<TransactionDetailType>>[
                ButtonSegment<TransactionDetailType>(
                  value: TransactionDetailType.all,
                  label: Text('All',)),
                ButtonSegment<TransactionDetailType>(
                  value: TransactionDetailType.all,
                  label: Text('Debit')),
                 ButtonSegment<TransactionDetailType>(
                  value: TransactionDetailType.all,
                  label: Text('Credit')),
                ],
              selected: typeTransaction,
              onSelectionChanged: (Set<TransactionDetailType> selectedType) {
                // Handle the selection change here
              },
              emptySelectionAllowed: true,
            )
          ],
        ),
      ),
    );
  }
}
