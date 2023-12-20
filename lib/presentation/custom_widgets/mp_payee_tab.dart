// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_x/presentation/screen/bill_splitter_manuallly_screen/controllers/bill_splitter_manuallly_screen_controller.dart';
// import 'package:input_slider/input_slider.dart';

// import '../../data/model/payor.dart';

// class PayeeTab extends StatelessWidget {
//   const PayeeTab(this.payor,this.amount,{super.key});

//   final Payor payor; 
//   final Double amount;
  


//   @override
//   Widget build(BuildContext context) {
//     Get.find<BillSplitterManualllyScreenController>(tag:'updateSlider');
//   var screenSize = MediaQuery.of(context).size;
//     return SizedBox(
//           width: screenSize.width * 60,
//                         height: 100,
//                         child: Container(
//                           margin: EdgeInsets.fromLTRB(24, 8, 24, 0),
//                           color: Colors.blueAccent,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             mainAxisSize: MainAxisSize.min,
//                             // ignore: prefer_const_constructors
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 // ignore: prefer_const_constructors
//                                 children: [
//                                   Expanded(
//                                       flex: 3,
//                                       child: Expanded(
//                                           flex: 2, child: Text(payor.payorName as String))),
//                                   Text(payor.payable as String),
//                                 ],
//                               ),
//                               Spacer(),
//                               Container(
//                                 width: 100,
//                                 height: 50,
//                                 color: Colors.brown,
//                                 child: InputSlider(
//                                     onChange: (sliderValue) {
//                                       controller.updateSlider(sliderValue);
//                                     },
//                                     min: 0,
//                                     max: 100,
//                                     defaultValue: 0),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
// }
// }