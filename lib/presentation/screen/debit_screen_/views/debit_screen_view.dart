import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';
import 'package:get_x/presentation/app_colors.dart';

import '../controllers/debit_screen_controller.dart';

class DebitScreenView extends GetView<DebitScreenController> {
  DebitScreenView({Key? key}) : super(key: key);

  var argumentAmount = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (argumentAmount != null) {
      controller.amountToSplit.value = argumentAmount;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a transaction',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primaryBase,
        centerTitle: false,
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
                      final bill = controller.listOfDebitTransactions[index];
                      return InkWell(
                        // highlightColor: Colors.blue,
                        onTap: () {
                          controller.selectBill(bill);
                          Get.offAllNamed(Routes.BILL_SPLITTER_SCREEN,
                              arguments: {'billAmount': bill.amount});
                        },
                        child: Obx(() {
                          return Container(
                            height: 80,
                            width: 200,
                            padding: EdgeInsets.fromLTRB(16, 8, 4, 16),
                            decoration: BoxDecoration(
                                color: controller.billtoPay.contains(bill)
                                    ? AppColors.primaryBase
                                    : AppColors.secondary,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      controller
                                          .listOfDebitTransactions[index].amount
                                          .toStringAsFixed(2),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                        'Paid to: ${controller.listOfDebitTransactions[index].description}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold))),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                        '${controller.listOfDebitTransactions[index].date}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal))),
                              ],
                            ),
                          );
                        }),
                      );
                    }));
              }),
            )
          ],
        ),
      ),
    );
  }
}