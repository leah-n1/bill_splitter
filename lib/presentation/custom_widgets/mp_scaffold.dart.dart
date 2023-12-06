import 'package:flutter/widgets.dart';
import 'package:flutter_application_basic/presentation/utils/app_colors.dart';

class MPScaffold extends StatefulWidget {
  final Widget? appBar;
  final Widget? body;
  final Widget? bottomTabBar;

  const MPScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.bottomTabBar,
  }) : super(key: key);

  @override
  State<MPScaffold> createState() => _MPScaffold();
}

class _MPScaffold extends State<MPScaffold> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    debugPrint('screenSize: $screenSize');
    return Container(
      color: const Color.fromARGB(255, 217, 217, 217),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints innerConstraints) {
          debugPrint(
              'Inner constraints Size: ${innerConstraints.maxHeight} -  ${innerConstraints.maxWidth}');
          return Stack(
            clipBehavior: Clip.none,
            children: [
              widget.body == null
                  ? Positioned(
                      top: (screenSize.height * 0.10),
                      bottom: widget.bottomTabBar == null
                          ? 0.0
                          : (screenSize.height * 0.08),
                      left: 0,
                      right: 0,
                      child: Container(
                        color: AppColors.primaryBase,
                        height: screenSize.height * 0.8,
                        width: screenSize.width,
                      ),
                    )
                  : Positioned(
                      top: (screenSize.height * 0.10),
                      bottom: widget.bottomTabBar == null
                          ? 0.0
                          : (screenSize.height * 0.08),
                      left: 0,
                      right: 0,
                      child: widget.body ?? Container(),
                    ),
              widget.appBar == null
                  ? Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: AppColors.primaryBase,
                        height: screenSize.height * 0.10,
                        width: screenSize.width,
                      ),
                    )
                  : Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: AppColors.primaryBase,
                        height: screenSize.height * 0.10,
                        width: screenSize.width,
                        child: widget.appBar ?? Container(),
                      ),
                    ),
              widget.bottomTabBar == null
                  ? Container()
                  : Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        height: screenSize.height * 0.08,
                        width: screenSize.width,
                        child: widget.bottomTabBar ?? Container(),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}