import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/screens/join/widgets/small_button.dart';
import 'package:clout/screens/join/numberVerify.dart';

class ClouterJoin1 extends StatefulWidget {
  ClouterJoin1({Key? key}) : super(key: key);

  @override
  _ClouterJoin1State createState() => _ClouterJoin1State();
}

class _ClouterJoin1State extends State<ClouterJoin1> {
  double percent = 0.33;

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
