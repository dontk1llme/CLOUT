import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/screens/join/widgets/small_button.dart';
import 'package:clout/screens/join/numberVerify.dart';


class ClouterJoin3 extends StatefulWidget {
  ClouterJoin3({Key? key}) : super(key: key);

  @override
  _ClouterJoin3State createState() => _ClouterJoin3State();
}

class _ClouterJoin3State extends State<ClouterJoin3> {
  double percent = 1; // 초기값 설정

  @override
  Widget build(BuildContext context) {
    return Column( // Use a Column to layout multiple widgets vertically
        children: <Widget>[
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            percent: percent,
            lineHeight: 10,
            backgroundColor: style.colors['category'],
            progressColor: style.colors['logo'],
            barRadius: Radius.circular(5),
          ),
          
        ],
      );
  }
}
