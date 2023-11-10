import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/common/choicechip.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/screens/point/widgets/my_wallet.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/point/widgets/point_item_box.dart';

class ClouterPointList extends StatefulWidget {
  const ClouterPointList({super.key});

  @override
  State<ClouterPointList> createState() => _ClouterPointListState();
}

class _ClouterPointListState extends State<ClouterPointList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.colors['white'],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 4,
          headerTitle: '포인트 관리', // 채널명 또는 계정명
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: BouncingListview(
          child: FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 0.9,
            child: Column(
              children: [
                MyWallet(userType: 'clouter'),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('포인트 내역',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 19)),
                ),
                ActionChoiceExample(
                    labels: ['전체 내역', '적립 내역', '출금 내역'], chipCount: 3),
                Divider(
                  color: style.colors['lightgray'],
                  thickness: 1,
                ),
                PointItemBox(type: '출금', time: '날짜시간', title: '누구셍세야', point: '500',),
                // PointItemBox(type: '충전'),
                // PointItemBox(type: '사용'),
                // PointItemBox(type: '사용'),
                // PointItemBox(type: '출금'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
