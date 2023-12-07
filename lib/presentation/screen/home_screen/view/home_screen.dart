import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/presentation/app_colors.dart';
import 'package:get_x/presentation/screen/home_detail_screen/views/home_detail_screen_view.dart';

import '../../../../app/routes/app_pages.dart';
import '../../../custom_widgets/mp_list_tile.dart';
import '../controller/home_screen_controller.dart';

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

  void _incrementCounter() {
    // setState(() {
    controller.counter++;
    controller.counterPlus2.value = controller.counterPlus2.value + 2;
    controller.counterPlus3.value = controller.counterPlus2.value + 3;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homeAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                height: 120,
                margin: const EdgeInsets.fromLTRB(36, 8, 36, 24),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 0,
                        offset: Offset(0, 2),
                        spreadRadius: 2,
                      )
                    ],
                    color: AppColors.primaryBase,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Available Balance',
                            style: TextStyle(
                                color: AppColors.dark,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          Text(
                            'PHP --, --',
                            style: TextStyle(
                                color: AppColors.dark,
                                fontWeight: FontWeight.normal,
                                fontSize: 24),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Account Number:',
                            style: TextStyle(
                                color: AppColors.dark,
                                fontWeight: FontWeight.normal,
                                fontSize: 10),
                          )
                        ],
                      ),
                    ]),
              ),
              const SizedBox(height: 8),
              Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(36, 8, 36, 24),
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
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Transactions',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Image(image: AssetImage('assets/images/arrowright.png'))
                    ],
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 80,
                      color: Colors.red,
                    ),
                    Container(
                      width: 80,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 80,
                      color: Colors.green,
                    ),
                    Container(
                      width: 80,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 80,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  AppBar homeAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Image.asset('assets/images/banking_app_logo.png'),
      ),
      backgroundColor: AppColors.white,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.dark),
          ),
          Text(
            'User first name',
            style: TextStyle(
                fontSize: 16,
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
      elevation: 2,
      shadowColor: Colors.black,
    );
  }
}
