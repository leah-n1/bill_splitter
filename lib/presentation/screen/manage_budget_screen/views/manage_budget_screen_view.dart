import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/manage_budget_screen_controller.dart';

class ManageBudgetScreenView extends GetView<ManageBudgetScreenController> {
  const ManageBudgetScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManageBudgetScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManageBudgetScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
