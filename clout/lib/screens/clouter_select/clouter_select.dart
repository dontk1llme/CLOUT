import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/screens/point/withdraw/widgets/bold_text.dart';
import 'package:clout/screens/detail/clouter/widgets/medium_text.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/clouter_select/widgets/select_item_box.dart';

class ClouterSelect extends StatelessWidget {
  const ClouterSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 4,
          headerTitle: '클라우터 채택',
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: BouncingListview(
          child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.filter_list, size: 20),
                      Text(' 정렬'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 110),
                    child: Column(children: [
                      SelectItemBox(),
                      SelectItemBox(),
                      SelectItemBox(),
                      SelectItemBox(),
                      SelectItemBox(),
                      SelectItemBox(),
                    ]),
                  ),
                ],
              )),
        ),
      ),
      bottomSheet: Container(
          height: 110,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: style.colors['category']!,
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediumText(text: '전체 지원자'),
                    BoldText(text: '121명'),
                  ],
                ),
              ),
              VerticalDivider(
                color: style.colors['lightgray'],
                thickness: 1,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediumText(text: '채택 인원'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('2명',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: style.colors['main1'])),
                        BoldText(text: ' / 5명')
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
