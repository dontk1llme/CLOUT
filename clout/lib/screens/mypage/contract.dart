// 계약서
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/list/category_list.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';
import 'package:clout/widgets/input/search_bar.dart';
import 'package:clout/widgets/header/header.dart';

class Contract extends StatelessWidget {
  const Contract({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final boxWidth = screenWidth;
    final boxPadding = screenWidth > 400 ? 12.0 : 10.0;

    return Scaffold(
      backgroundColor: style.colors['white'],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 4,
          headerTitle: 'OOO님과의 계약서',
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              width: boxWidth,
              padding: EdgeInsets.all(boxPadding),
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
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                // 기능 없음! 아래 버튼들 누르지 마시오!
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: BigButton(
                      title: '계약서 저장하기',
                      function: () {},
                    )),
                SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: BigButton(
                      title: '카카오톡 전송하기',
                      function: () {},
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
