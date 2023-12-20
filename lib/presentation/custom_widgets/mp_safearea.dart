import 'package:flutter/widgets.dart';

class MPSafeLayout extends StatelessWidget {
  final Widget? child;
  const MPSafeLayout({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets safeArea = MediaQuery.of(context).padding;
    return Padding(
      padding: safeArea,
      child: child,
    );
  }
}