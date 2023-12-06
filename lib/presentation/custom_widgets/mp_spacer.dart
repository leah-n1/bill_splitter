import 'package:flutter/widgets.dart';

class MPSpacer extends StatelessWidget {
  final int flex;

  const MPSpacer({super.key, this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Container(),
    );
  }
}
