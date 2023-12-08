import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MPListTile extends StatefulWidget {
  final Color backgroundColor;
  final double boarderRadius;
  final Size size;
  final EdgeInsets margin;

  final String placeholder1;
  final String placeholder2;
  final String placeholder3;

  final bool isDebit;

  const MPListTile(
      {super.key,
      this.backgroundColor = const Color(0xFFFEF9F9),
      required this.size,
      required this.placeholder1,
      required this.placeholder2,
      required this.placeholder3,
      this.boarderRadius = 0.0,
      this.margin = const EdgeInsets.all(10),
      this.isDebit = true});

  @override
  State<MPListTile> createState() => _MPListTileState();
}

class _MPListTileState extends State<MPListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height > 668 ? (widget.size.height * 0.16) : (widget.size.height * 0.20),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.boarderRadius),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 4),
            blurStyle: BlurStyle.outer,
            spreadRadius: 0.15,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: widget.backgroundColor,
              margin: const EdgeInsets.fromLTRB(8,8,20,8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.placeholder1,
                    style: TextStyle(
                        color: widget.isDebit
                    ? const Color(0xFFDC6565)
                    : const Color(0xFF7DA07A),
                        fontWeight: FontWeight.w800,),
                  ),
                  Text(
                    widget.placeholder2,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    widget.placeholder3,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              height: widget.size.height * 0.10,
              width: widget.size.height * 0.10,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: widget.isDebit
                    ? Image.asset(
                        'assets/images/icon_tile_debit.png',
                        fit: BoxFit.fitHeight,
                      )
                    : Container(),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}