import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';
import 'package:get_x/data/model/contact.dart';
import 'package:get_x/presentation/app_colors.dart';
import '../../contacts_screen/controllers/contacts_screen_controller.dart';



import '../controllers/bill_splitter_screen_controller.dart';

class BillSplitterScreenView extends GetView<BillSplitterScreenController> {
   BillSplitterScreenView({Key? key}) : super(key: key);

var  arguments = Get.arguments;



  @override
  Widget build(BuildContext context) {
    // controller.listOfPayees =  payeeController;
    var screenSize = MediaQuery.of(context).size;
     
    // final ContactsScreenController c = Get.find();
    // final List<Payor> payors = [];
    final List<String> divider = ['Evenly', 'Manually'];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBase,
          title: const Text(
            'Split Bill Evenly',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
        ),
        body:
            // Obx(() {
            //   return
            Column(
          children: [
            const SizedBox(height: 8),
            amountDisplay(screenSize),
            const SizedBox(height: 4),
            division(divider, controller),
            friendsSearchBar(),
            payorList(screenSize, controller, controller.payeeController),
          ],
        ));
  }

  Container friendsSearchBar() {
    return Container(
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
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
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
                      child: InkWell(
                        onTap:() {
                          Get.toNamed(Routes.CONTACTS_SCREEN);
                        },
                        child: Image.asset('assets/images/expandarrowdown.png',
                            height: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  Padding division(
      List<String> divider, BillSplitterScreenController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Divide:'),
          const SizedBox(width: 30),
          Obx(() {
            return Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(
                divider.length,
                (int index) {
                  return ChoiceChip(
                      label: Text(divider[index]),
                      selected: controller.selectedDivider == index,
                      onSelected: (bool selected) {
                        controller.updateSelectedDivider(selected ? index : 0);
                      });
                },
              ).toList(),
            );
          }),
        ],
      ),
    );
  }

  Center amountDisplay(Size screenSize) {
    
    return Center(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Obx(
                () {
                  return TextField(
                    controller: controller.amountController.value,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    onChanged: (value) {
                      print('value updatwd $value');
                      controller.updateTotalAmount(value);

                  
                      // controller.calculateSubtotal(
                      //     amount: (value), numberOfPayees: 2);
                  
                      // controller.calculatePercentage(
                      //     amount: (value), numberOfPayees: 2);
                  
                      // controller.calculateSliderValue(
                      //     amount: (value), numberOfPayees: 2);
                  
                      // controller.amountController.value.text = '';
                      // String formattedValue = NumberFormat.decimalPattern()
                      //     .format(int.parse(value.replaceAll(',', '')));
                      // print(formattedValue);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                      hintText: 'Enter amount here',
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container payorList(
      Size screenSize, BillSplitterScreenController controller, ContactsScreenController? payeeController) {
       
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 36, 16, 16),
      padding: const EdgeInsets.all(4),
      height: screenSize.height * .50,
      child: Obx(
         () {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: controller.payeeController?.selectedPayees.length ?? 0 ,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final UniqueKey itemKey = UniqueKey();
          
              return Dismissible(
                  onDismissed: (direction) { if (controller.payeeController?.selectedPayees == null ){
                    controller.payeeController?.removePayee(controller.payeeController!.selectedPayees[index]);
                  }
                    
                    
                    
                  },
                  key: itemKey,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(71, 158, 158, 158),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () {
                                      return Text ('${controller.payeeController?.selectedPayees[index].name}');
                                    }
                                  )
                                ],
                              ),
                              const Spacer(),
                              Container(
                                width: 100,
                                height: 30,
                                color: Colors.amber,
                                child: Obx(() {
                                  return TextField(
                                    textAlign: TextAlign.center,
                                    readOnly:
                                        controller.selectedDivider.value == 0
                                            ? true
                                            : false,
                                    controller:
                                        controller.subtotalController.value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: -1),
                                  );
                                }),
                              )
                            ],
                          ),
                          Container(
                              padding: const EdgeInsets.all(8),
                              height: 50,
                              color: AppColors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Color.fromARGB(255, 27, 194, 150),
                                        child: Obx(() {
                                          return TextField(
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            readOnly:
                                                controller.selectedDivider.value ==
                                                        0
                                                    ? true
                                                    : false,
                                            textAlign: TextAlign.center,
                                            controller: controller
                                                .percentageController.value,
                                            onChanged: (value) {
                                              controller.percentageController;
                                            },
                                          );
                                        }),
                                      )),
                                  Expanded(
                                    flex: 6,
                                    child: SizedBox(
                                      child: Obx(() {
                                        return Slider(
                                          min: 0.0,
                                          max: 100.0,
                                          key: itemKey,
                                          value: controller.sliderValue.value,
                                          onChanged:
                                              controller.selectedDivider.value == 1
                                                  ? (value) {
                                                      controller.sliderValue.value =
                                                          value;
                                                    }
                                                  : null,
                                        );
                                      }),
                                    ),
                                  )
                                ],
                              ))
                        ]),
                  ));
            },
          );
        }
      ),
    );
  }
}
