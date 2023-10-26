import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:get/get.dart';

import '../../style.dart' as style;
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/screens/join/widgets/small_button.dart';
import 'package:clout/screens/join/numberVerify.dart';

class ClouterJoin extends StatelessWidget {
  const ClouterJoin({super.key});

  @override
  Widget build(BuildContext context) {
    double percent = 0.3;


    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left:25, top:15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('가입하고', style: style.textTheme.titleMedium),
            Row(
              children: <Widget>[
                Text('CLOUT', style: style.textTheme.titleMedium?.copyWith(
                  color: style.colors['main1'])),
                Text('와 함께', style: style.textTheme.titleMedium),
              ],
            ),
            Text('매칭해요', style: style.textTheme.titleMedium),
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              percent: percent,
              lineHeight: 10,
              backgroundColor: Colors.black38,
              progressColor: Colors.indigo.shade900,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
