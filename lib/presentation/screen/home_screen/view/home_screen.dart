import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/presentation/screen/home_detail_screen/views/home_detail_screen_view.dart';

import '../../../../app/routes/app_pages.dart';
import '../controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeController controller = HomeController();
  final HomeScreenController controller = Get.put(HomeScreenController());

  void _incrementCounter() {
    // setState(() {
    controller.counter++;
    controller.counterPlus2.value = controller.counterPlus2.value +2;
    controller.counterPlus3.value = controller.counterPlus2.value +3;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Obx(
          () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${controller.counter.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                 Text(
                  '${controller.counterPlus2.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                 Text(
                  '${controller.counterPlus3.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed('/home-detail-screen', arguments:'get is best' );
                  },
                  child: Container(
                    color: Colors.amber,
                    width:100,
                    height:100,
                    child: Text('Navigate to details screen')
                  ),
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
