// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'mp_spacer.dart';

class MPAppBar extends StatefulWidget {
  final Size screenSize;
  final Color backgroundColor;
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final Widget? trailingWidget;
  final bool isDetailView;

  const MPAppBar({
    Key? key,
    required this.screenSize,
    this.backgroundColor = const Color.fromARGB(255, 243, 243, 243),
    this.leadingWidget,
    this.titleWidget,
    this.trailingWidget,
    this.isDetailView = false,
  }) : super(key: key);

  @override
  State<MPAppBar> createState() => _MPAppBarState();
}

class _MPAppBarState extends State<MPAppBar> {
  @override
  Widget build(BuildContext context) {
    var size = widget.screenSize;
    return Container(
      height: size.height * 0.10,
      width: 400,
      color: widget.backgroundColor,
      child: widget.isDetailView
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.leadingWidget ?? Container(),
                widget.titleWidget ?? Container(),
                const MPSpacer(),
                widget.trailingWidget ?? Container(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    //     color: AppColors.primaryBase100,
                    child: widget.leadingWidget ?? Container(),
                  ),
                ),
                Expanded(
                  child: Container(
                    //    color: AppColors.primaryBase200,
                    child: widget.titleWidget ?? Container(),
                  ),
                ),
                Expanded(
                  child: Container(
                    //  color: AppColors.primaryBase500,
                    child: widget.trailingWidget ?? Container(),
                  ),
                ),
              ],
            ),
    );
  }
}