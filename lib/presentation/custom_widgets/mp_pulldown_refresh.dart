import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MPPullDownRefresh extends StatefulWidget {
  final Widget scrollWidget;
  final Future<void> Function() onRefresh;

  const MPPullDownRefresh(
      {super.key, required this.scrollWidget, required this.onRefresh});

  @override
  State<MPPullDownRefresh> createState() => _MPPullDownRefreshState();
}

class _MPPullDownRefreshState extends State<MPPullDownRefresh> {
  bool isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            //print(scrollNotification.metrics.pixels); // 150
            // print(scrollNotification
            //     .metrics.axisDirection); // axis direction from up to down
            if ((scrollNotification.metrics.pixels <= -110) &&
                !isRefreshing && //false
                (scrollNotification.metrics.axisDirection ==
                    AxisDirection.down)) {
              setState(() {
                isRefreshing = true;
              });
              widget.onRefresh().then((_) {
                setState(() {
                  isRefreshing = false;
                });
              });
            }
            return false;
          },
          child: widget.scrollWidget,
        ),
        if (isRefreshing)
          Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(105),
                color: const Color.fromARGB(100, 0, 42, 180),
              ),
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  size: 50,
                ), //Text("Pull to Refresh"),
              ),
            ),
          ),
      ],
    );
  }
}