import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/data/model/features.dart';
import 'package:get_x/data/model/services.dart';

import 'package:get_x/presentation/app_colors.dart';

import '../../../../app/routes/app_pages.dart';
import '../controller/home_screen_controller.dart';



class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeController controller = HomeController();
  final HomeScreenController controller = Get.put(HomeScreenController());

  
  
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homeAppBar(),
        body: ListView(children: [
          accountDetails(),
          transactions(),
          appFeatures(),
          bankServices(),
          payNow(),
        ]));
  }

  Container payNow() {
    return Container(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          height: 40,
          margin: const EdgeInsets.only(top: 16, left: 30, right: 30),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 40,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
            color: const Color.fromARGB(255, 167, 182, 166),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Image(
                image: AssetImage('assets/images/scanqr.png'),
              ),
              const SizedBox(width: 4),
              Text(
                'Pay',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.dark),
              )
            ],
          ),
        );
  }

  Column appFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 12,
          ),
          child: Text(
            'Features',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(24, 4, 24, 0),
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
          height: 100,
          color: Colors.white,
          child: ListView.separated(
              itemCount: availableFeatures.length,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(width: 4),
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: AppColors.secondary,
                  onTap: () {
                    Get.toNamed(availableFeatures[index].route);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 20,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              ),
                            ],
                         
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color:AppColors.secondary,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 40,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              ),],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                                availableFeatures[index].iconPath,
                                width: 60,
                                height: 60),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Center(
                          child: Text(
                            availableFeatures[index].service,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Container bankServices() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 12, 24, 4),
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
      height: 200,
      child: ListView.separated(
          itemCount: availableServices.length,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(width: 14),
          itemBuilder: (context, index) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: AppColors.secondary,
                onTap: () {
                  Get.toNamed(availableServices[index].route);
                },
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 40,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                      ],
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Expanded(
                            child: Image.asset(availableServices[index].iconPath,
                                width: 80, height: 80),
                          ),
                        ),
                      ),
                      Text(
                        availableServices[index].service,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 8),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Container transactions() {
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
        height: 60,
        margin: const EdgeInsets.only(top: 24, left: 30, right: 30),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 40,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Transactions',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            InkResponse(
              onTap: (){Get.toNamed(Routes.TRANSACTION_DETAILS_SCREEN);},
              child: const SizedBox(
                child: Image(height: 30, image: AssetImage('assets/images/arrowright.png'))),
            )
          ],
        ));
  }

  Container accountDetails() {
    return Container(
      padding: const EdgeInsets.all(32),
      height: 160,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 0,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
          color: AppColors.primaryBase,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Available Balance',
            style: TextStyle(
                color: AppColors.dark,
                fontWeight: FontWeight.normal,
                fontSize: 12),
          ),
          Text(
            'PHP ${controller.userProfile.value?.balance.toStringAsFixed(2)}',
            style: TextStyle(
                color: AppColors.dark,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          const SizedBox(height: 8),
          Text(
            'Account Number: ${controller.userProfile.value?.accountNumber}',
            style: TextStyle(
                color: AppColors.dark,
                fontWeight: FontWeight.w600,
                fontSize: 10),
          )
        ],
      ),
    );
  }


AppBar homeAppBar() {
  return AppBar(
   leading: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Image.asset('assets/images/banklogo_with_border.png',),
    ),
    backgroundColor: AppColors.primaryBase,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.dark),
        ),
        Text(
          '${controller.userProfile.value?.firstName}',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: AppColors.dark),
        ),
      ],
    ),
    centerTitle: false,
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/profile.png'),
          const SizedBox(width: 4),
          Image.asset('assets/images/messages.png'),
          const SizedBox(width: 16)
        ],
      ),
    ],
   
    shadowColor: Colors.black,
  );
}
}
