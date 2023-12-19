import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test_widget_controller.dart';

class TestWidgetView extends GetView<TestWidgetController> {
  const TestWidgetView({Key? key}) : super(key: key);
  @override
 Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Interaction Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: controller.amountController.value,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.updateAmount(double.parse(value));
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.percentageController.value,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.updatePercentage(double.parse(value));
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Percentage',
                ),
              ),
              const SizedBox(height: 16),
              Obx(() {
                return Slider(
                  value: controller.amount.value,
                  onChanged: (value) {
                    controller.updateAmount(value);
                  },
                  min: 0.0,
                  max: 100.0,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}