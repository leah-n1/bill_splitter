import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_x/presentation/app_colors.dart';

import '../controllers/bill_splitter_screen_controller.dart';

class BillSplitterScreenView extends GetView<BillSplitterScreenController> {
  const BillSplitterScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final List<String> items = ['Evenly', 'Manually'];
    int? value= 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBase,
        title: const Text(
          'Bill Splitter',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Center(
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 4,
              child: Container(
                color: AppColors.primaryBase,
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 4),
                height: 100,
                width: screenSize.width * .8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Total Amount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                        labelText: 'Enter amount here',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 36, right: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Divide:'),
                const SizedBox(width: 30),
                SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      GetBuilder<BillSplitterScreenController>(
                        builder: (controller) => ChoiceChip(
                          label: const Text('Evenly'),
                          selected: controller.value == 0,
                          onSelected: (bool selected) {
                            controller.updateValue(selected ? 0 : 1);
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      GetBuilder<BillSplitterScreenController>(
                        builder: (controller) => ChoiceChip(
                          label: const Text('Manually'),
                          selected: controller.value == 1,
                          onSelected: (bool selected) {
                            controller.updateValue(selected ? 1 : 0);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
