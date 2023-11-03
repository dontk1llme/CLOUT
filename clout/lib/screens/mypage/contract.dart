// 계약서
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/widgets/header/header.dart';

class Contract extends StatelessWidget {
  const Contract({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final boxWidth = screenWidth;

    return Scaffold(
      backgroundColor: style.colors['white'],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 4,
          headerTitle: 'OOO님과의 계약서',
        ),
      ),
      body: BouncingListview(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              width: boxWidth,
              padding: EdgeInsets.all(screenWidth > 400 ? 30 : 20),
              decoration: BoxDecoration(
                color: style.colors['white'],
                boxShadow: style.shadows['shadow'],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '계약서\n',
                    style: style.textTheme.titleSmall,
                  ),
                  Text(
                    '계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. 계약서 내용입니다. 집에 가고 싶습니다. ',
                    style: style.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          // 💥 클라우터, 광고주 둘 다 전자서명시 <<계약서 저장하기>>버튼 보여주고,
          // 한 명이라도 전자서명 미진행시 <<신청 취소하기>> 버튼 보여주기
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                // 기능 없음! 아래 버튼들 누르지 마시오!
                SizedBox(
                    width: double.infinity,
                    child: BigButton(
                      title: '계약서 저장하기',
                      function: () {},
                    )),
                SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    child: BigButton(
                      title: '카카오톡 전송하기',
                      function: () {},
                    )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
