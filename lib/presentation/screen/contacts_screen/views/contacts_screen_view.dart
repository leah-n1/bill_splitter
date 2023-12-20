import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/presentation/app_colors.dart';

import '../controllers/contacts_screen_controller.dart';

class ContactsScreenView extends GetView<ContactsScreenController> {
  const ContactsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBase,
        title: const Text(
          'Contacts',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 336,
              height: screenSize.height * .80,
              margin: const EdgeInsets.all(16),
              child: Obx(
                () {
                  return ListView.separated(
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 4,
                          color: Colors.white,
                        );
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: controller.listOfcontacts.length,
                      itemBuilder: ((context, index) {
                        final contact = controller.listOfcontacts[index];
                        return InkWell(
                          // highlightColor: Colors.blue,
                          onTap: () {
                            controller.selectPayees(contact);
                            controller.getCountofPayees();
                          },
                          child: Obx(
                             () {
                              return Container(
                                height: 80,
                                width: 200,
                                padding: EdgeInsets.fromLTRB(16, 8, 4, 16),
                                decoration: BoxDecoration(
                                    color: controller.selectedPayees.contains(contact) ? AppColors.primaryBase : AppColors.secondary,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          '${controller.listOfcontacts[index].name}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                            'Account no: ${controller.listOfcontacts[index].accountNumber}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                ),
                              );
                            }
                          ),
                        );
                      }));
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
