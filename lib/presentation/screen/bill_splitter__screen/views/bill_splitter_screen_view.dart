import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bill_splitter_screen_controller.dart';

class BillSplitterScreenView extends GetView<BillSplitterScreenController> {
  const BillSplitterScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BillSplitterScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BillSplitterScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
