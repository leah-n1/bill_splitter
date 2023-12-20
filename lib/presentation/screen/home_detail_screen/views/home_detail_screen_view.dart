// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_detail_screen_controller.dart';

class HomeDetailScreenView extends GetView<HomeDetailScreenController> {
  final  valueFromParent;
  const HomeDetailScreenView({
    this.valueFromParent,
    Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
   var datafromParent= Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeDetailScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            Get.back();},
          child: Text(
            '$datafromParent',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
