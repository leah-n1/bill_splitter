import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/presentation/app_colors.dart';
import 'package:get_x/presentation/custom_widgets/mp_list_tile.dart';

import '../controllers/transaction_details_screen_controller.dart';

enum TransactionDetailType { all, debit, credit }

class TransactionDetailsScreenView
    extends GetView<TransactionDetailsScreenController> {
  final Set<TransactionDetailType> typeTransaction = <TransactionDetailType>{};
  


  TransactionDetailsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var screenSize = MediaQuery.of(context).size;
     
    var listView = ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    itemBuilder:(content,index){
                      return MPListTile(
                        size: Size(0,screenSize.height*.50),
                        placeholder1: 'PHP 25,000',
                        placeholder2: 'To or From:',
                        placeholder3: 'Date ',
                        );
                    } );
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
            ),
            SizedBox(height: 8),
            
                SizedBox(
                  child: listView,
                ),
               
             
          ],
        ),
      ),
    );
  }
}
