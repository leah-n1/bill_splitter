import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/presentation/app_colors.dart';

import '../controllers/transaction_details_screen_controller.dart';






class TransactionDetailsScreenView extends GetView<TransactionDetailsScreenController> {
  const TransactionDetailsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction HIstory', style: TextStyle(fontSize: 16),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 336,
              height: screenSize.height * .80,
              margin: const EdgeInsets.all(16),
              child: Obx(() {
                return ListView.separated(
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 4,
                        color: Colors.white,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: controller.listOfDebitTransactions.length,
                    itemBuilder: ((context, index) {
                      // final bill = controller.listOfDebitTransactions[index];
                      return Obx(() {
                        return Container(
                          height: 100,
                          width: 200,
                          padding: const EdgeInsets.fromLTRB(16, 8, 4, 16),
                          decoration: BoxDecoration(
                              color: controller.listOfTransactions[index].type == 'Debit'
                              ? Color.fromARGB(52, 229, 95, 95) : AppColors.secondary,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Php ${controller.listOfTransactions[index].amount.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text( 
                                     controller.listOfTransactions[index].type == 'Debit'
                                     ? 'Paid to: ${controller.listOfTransactions[index].description}'
                                      : 'Received from: ${controller.listOfTransactions[index].description}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))),
                               Expanded(
                                  flex: 1,
                                  child: Text(
                                      controller.listOfDebitTransactions[index].date,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal))),
                            ],
                          ),
                        );
                      });
                    }));
              }),
            )
          ],
        ),
      ),
    );
  }
}
