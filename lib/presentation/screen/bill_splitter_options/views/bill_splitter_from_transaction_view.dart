import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';
import 'package:get_x/presentation/app_colors.dart';

import '../controllers/bill_splitter_options_controller.dart';

class BillSplitterOptionsView extends GetView<BillSplitterOptionsController> {
  const BillSplitterOptionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBase,
        title: const Text('Split from Bills',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            totalAmountDisplay(screenSize),
            const SizedBox(height: 4),
            Container(
              width: screenSize.width * .85,
              height: screenSize.height * .55,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(71, 158, 158, 158), borderRadius: BorderRadius.circular(8)),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  itemBuilder: (content, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                          contentPadding: const EdgeInsets.fromLTRB(12, 4,12,4),
                          title: const Text('PHP',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          subtitle: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('Paid to',style:TextStyle(fontSize: 12, fontWeight: FontWeight.w500)), Text('Date:',style: TextStyle(fontSize: 10),)],
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                          isThreeLine: true,
                          value: false,
                          onChanged: (bool? value) {
                            
                          },
                        ),
                         const Divider(height: 4)
                      ],
                    );
                  }),
            ),
           
           Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    TextButton(onPressed: () {
                      Get.toNamed(Routes.HOME);
                      
                    }, child: const Text('Cancel')),
                    ElevatedButton(onPressed: () {}, child: const Text('Done')),
                  ],
                )
              
          ],
        ),
      ),
    );
  }

  Card totalAmountDisplay(Size screenSize) {
    return Card(
            margin: EdgeInsets.fromLTRB(30,16,30,4),
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
                  const Text('Total amount to be splitted',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12)),
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: const [],
                    onChanged: (value) {
                      ;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                      hintText: 'Enter amount here',
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
