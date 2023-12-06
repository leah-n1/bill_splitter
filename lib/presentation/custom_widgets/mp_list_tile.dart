import 'package:flutter/widgets.dart';

class MPListTile extends StatelessWidget {
  final Color backgroundColor;
  final double boarderRadius;
  final Size size;
  final EdgeInsets margin;

  final String placeholder1;
  final String placeholder2;
  final String placeholder3;
  final String placeholder4;
  final bool isCredit;

  const MPListTile(
      {super.key,
      this.backgroundColor = const Color(0xFFFEF9F9),
      required this.size,
      required this.placeholder1,
      required this.placeholder2,
      required this.placeholder3,
      this.boarderRadius = 0.0,
      this.margin = const EdgeInsets.all(10),
      required this.placeholder4,
      this.isCredit = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height > 668 ? (size.height * 0.16) : (size.height * 0.20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(boarderRadius),
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
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: isCredit
                    ? const Color(0xFFDC6565)
                    : const Color(0xFF7DA07A),
              ),
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              height: size.height * 0.10,
              width: size.height * 0.10,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: isCredit
                    ? Image.asset(
                        'assets/images/icon_tile_debit.png',
                        fit: BoxFit.fitHeight,
                      )
                    : Image.asset(
                        'assets/images/icon_tile_credit.png',
                        fit: BoxFit.fitHeight,
                      ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: backgroundColor,
              margin: const EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    placeholder1,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    placeholder2,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    placeholder3,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    placeholder4,
                    style: TextStyle(
                      color: isCredit
                          ? const Color(0xFFDC6565)
                          : const Color(0xFF7DA07A),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}