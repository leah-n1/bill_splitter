// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_x/presentation/app_colors.dart';


import '../controllers/bill_splitter_manuallly_screen_controller.dart';

class BillSplitterManualllyScreenView
    extends GetView<BillSplitterManualllyScreenController> {
  const BillSplitterManualllyScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Split Bill Manually',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primaryBase,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.all(16),
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
                          hintText: 'Enter amount here',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text('Select Amount from Transactions')),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
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
                      hintStyle: const TextStyle(
                          color: Color(0xffDDDADA), fontSize: 14),
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
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  ;
                  return ;
                },
              ),
            ]),
      ),
    );
  }
}
