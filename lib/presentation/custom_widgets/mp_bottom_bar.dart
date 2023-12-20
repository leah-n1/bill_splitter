import 'package:flutter/widgets.dart';

class MPBottomTabBar extends StatefulWidget {
  final Size screenSize;
  final Color backgroundColor;

  const MPBottomTabBar({
    super.key,
    required this.screenSize,
    this.backgroundColor = const Color.fromARGB(255, 255, 255, 255),
  });

  @override
  State<MPBottomTabBar> createState() => _MPBottomTabBarState();
}

class _MPBottomTabBarState extends State<MPBottomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, -5),
            blurStyle: BlurStyle.outer,
            spreadRadius: 0.10,
          )
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: widget.screenSize.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(32),
                    decoration: const BoxDecoration(
                      //  color: AppColors.dark,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/tab_bar_0.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(32),
                    decoration: const BoxDecoration(
                      //  color: AppColors.dark,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/tab_bar_1.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(32),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      //color: AppColors.dark,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/tab_bar_2.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      // color: AppColors.dark,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/tab_bar_3.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: widget.screenSize.height * 0.04,
            left: widget.screenSize.width * 0.50 -
                ((widget.screenSize.width * 0.16) -
                    ((widget.screenSize.width * 0.16) / 2)),
            child: Container(
              height: widget.screenSize.width * 0.16,
              width: widget.screenSize.width * 0.16,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular((widget.screenSize.width * 0.16) / 2),
                image: const DecorationImage(
                  image: AssetImage('assets/images/tab_bar_scan.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}