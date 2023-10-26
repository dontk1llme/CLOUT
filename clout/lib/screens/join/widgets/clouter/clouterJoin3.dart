import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/widgets/input/input.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/screens/join/widgets/small_button.dart';
import 'package:clout/screens/join/numberVerify.dart';
import 'package:clout/screens/campaign_register/widgets/region_multiselect.dart';

class ClouterJoin3 extends StatefulWidget {
  ClouterJoin3({Key? key}) : super(key: key);

  @override
  _ClouterJoin3State createState() => _ClouterJoin3State();
}

class _ClouterJoin3State extends State<ClouterJoin3> {
  double percent = 1; // 초기값 설정

  var maxFee;
  var minFee;
  var category;
  var region;


  setMaxFee(input){
    setState(() {
      maxFee = input;
    });
  }

  setMinFee(input){
    setState(() {
      minFee = input;
    });
  }

  setCategory(input){
    setState((){
      category = input;
    });
  }

  setRegion(input) {
    setState(() {
      region = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            percent: percent,
            lineHeight: 10,
            backgroundColor: style.colors['category'],
            progressColor: style.colors['logo'],
            barRadius: Radius.circular(5),
          ),
          SizedBox(height: 5), // 20픽셀의 공백
          Text(
            '3. 희망 광고 정보',
            style: style.textTheme.titleSmall, // 텍스트 스타일 설정
            textAlign: TextAlign.left, 
          ),
          SizedBox(height: 8), // 20픽셀의 공백
          Text(
            '희망 광고비',
            style: style.textTheme.bodyLarge, // 텍스트 스타일 설정
            textAlign: TextAlign.left, 
          ),
          Input(
            placeholder: '최소 금액 (만원)',
            setText: setMinFee,
          ),
          Input(
            placeholder: '최대 금액 (만원)',
            setText: setMaxFee,
          ),
          SizedBox(height: 8), // 20픽셀의 공백
          Text(
            '희망 카테고리 선택',
            style: style.textTheme.bodyLarge, // 텍스트 스타일 설정
            textAlign: TextAlign.left, 
          ),
          SizedBox(height: 8), // 20픽셀의 공백
          // RegionDropdown(region: region, setRegion: setRegion)

        ],
      );
  }
}
