import 'package:flutter/material.dart';

class PointItemBox extends StatefulWidget {
  const PointItemBox({super.key, required this.type});

  final String type;

  @override
  State<PointItemBox> createState() => _PointItemBoxState();
}

class _PointItemBoxState extends State<PointItemBox> {
  Color getTextColor() {
    switch (widget.type) {
      case '충전':
        return Colors.blue[700]!;
      case '출금':
        return Colors.red;
      case '사용':
        return Colors.black;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = getTextColor();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color.fromARGB(255, 208, 208, 208),
          ),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('2023.10.18 13:57'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('못골영농조합법인',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.type,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: textColor,
                    )),
                Text('+ 10,000 포인트',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: textColor,
                    ))
              ],
            )
          ],
        )
      ]),
    );
  }
}
