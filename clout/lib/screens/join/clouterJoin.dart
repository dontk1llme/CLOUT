import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/utilities/bouncing_listview.dart';

import '../../style.dart' as style;

import 'package:clout/screens/join/widgets/big_button.dart';

import 'package:clout/screens/join/widgets/clouter/clouterJoin1.dart';
import 'package:clout/screens/join/widgets/clouter/clouterJoin2.dart';
import 'package:clout/screens/join/widgets/clouter/clouterJoin3.dart';

class ClouterJoin extends StatefulWidget {
  const ClouterJoin({super.key});

  @override
  _ClouterJoinState createState() => _ClouterJoinState();
}

class _ClouterJoinState extends State<ClouterJoin> {
  int pageNum = 1;

  void setPageNum(int newPageNum) {
    setState(() {
      pageNum = newPageNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BouncingListview(
        child: Padding(
          padding: EdgeInsets.only(left: 25, top: 15, right: 25, bottom: 15),
          child: ListView(
            shrinkWrap: true,
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
              SizedBox(height: 10),  

              //페이지별로 보여주기
              if (pageNum == 1)
                ClouterJoin1(),
              if (pageNum == 2) 
                ClouterJoin2(),
              if (pageNum == 3) 
                ClouterJoin3(),
                SizedBox(height: 20), 
              BigButton(
                title: pageNum == 3 ? '완료' : '다음', // pageNum에 따라 버튼 텍스트 변경
                function: () {
                  if (pageNum <= 3) {
                    setPageNum(pageNum + 1);
                  }
                  if (pageNum==4){
                    Get.toNamed('/login');
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
