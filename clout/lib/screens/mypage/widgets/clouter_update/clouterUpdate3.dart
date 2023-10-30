import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/widgets/input/input.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/screens/join/widgets/small_button.dart';
import 'package:clout/screens/join/numberVerify.dart';
import 'package:clout/screens/join/widgets/clouter/categoryToggle.dart';
import 'package:clout/screens/campaign_register/widgets/region_multiselect.dart';

class ClouterUpdate3 extends StatefulWidget {
  ClouterUpdate3({Key? key}) : super(key: key);

  @override
  _ClouterUpdate3State createState() => _ClouterUpdate3State();
}

class _ClouterUpdate3State extends State<ClouterUpdate3> {
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
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Input(
                    placeholder: '최소 금액 (만원)',
                    setText: setMinFee,
                  ),
                ),
                SizedBox(width: 8), // 간격 조절
                Flexible(
                  flex: 1,
                  child: Input(
                    placeholder: '최대 금액 (만원)',
                    setText: setMaxFee,
                  ),
                ),
              ],
            ),
          SizedBox(height: 8), // 20픽셀의 공백
          Text(
            '희망 카테고리 선택',
            style: style.textTheme.bodyLarge, // 텍스트 스타일 설정
            textAlign: TextAlign.left, 
          ),
          // CategoryToggle(category: category, setCategory: setCategory),
          // 주석대로 나중에 수정해야 함. 현재는 선택한 거 데이터 전달이 안 되고 있음
          CategoryToggle(),
          SizedBox(height: 8), // 20픽셀의 공백
          // RegionDropdown(region: region, setRegion: setRegion)

        ],
      );
  }
}
