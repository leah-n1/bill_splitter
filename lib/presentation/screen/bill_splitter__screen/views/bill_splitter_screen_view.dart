import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_x/presentation/app_colors.dart';
import 'package:intl/intl.dart';

import '../controllers/bill_splitter_screen_controller.dart';

class BillSplitterScreenView extends GetView<BillSplitterScreenController> {
  const BillSplitterScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BillSplitterScreenController percentageController =
        Get.put(BillSplitterScreenController());
    var screenSize = MediaQuery.of(context).size;
    final List<String> items = ['Evenly', 'Manually'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBase,
        title: const Text(
          'Bill Splitter',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        return Column(
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
                        onChanged: (value) {
                          String formattedValue = NumberFormat.decimalPattern()
                              .format(int.parse(value.replaceAll(',', '')));
                          print(formattedValue);
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                          hintText: 'Enter amount here',
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
                  Wrap(
                    spacing: 5.0,
                    children: List<Widget>.generate(
                      items.length,
                      (int index) {
                        return ChoiceChip(
                            label: Text(items[index]),
                            selected:
                                percentageController.selectedDivider.value ==
                                    index,
                            onSelected: (bool selected) {
                              percentageController
                                  .updateSelectedDivider(selected ? index : 0);
                            });
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, left: 20, right: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: const Color(0xff1D1617).withOpacity(0.11),
                    blurRadius: 40,
                    spreadRadius: 0.0)
              ]),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(15),
                    hintText: 'Search contacts',
                    hintStyle:
                        const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        'assets/images/search_icon.png',
                        height: 16,
                      ),
                    ),
                    suffixIcon: SizedBox(
                      width: 100,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const VerticalDivider(
                              color: Colors.black,
                              indent: 10,
                              endIndent: 10,
                              thickness: 0.1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                  'assets/images/expandarrowdown.png',
                                  height: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none)),
              ),
            )
          ],
        );
      }),
    );
  }
}
