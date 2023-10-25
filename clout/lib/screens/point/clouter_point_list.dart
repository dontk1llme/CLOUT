import 'package:clout/screens/point/widgets/point_item_box.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/screens/point/widgets/my_wallet.dart';
import 'package:clout/widgets/header/header.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20), // 왼쪽과 오른쪽 패딩을 10으로 설정
        child: ListView(
          children: [
            MyWallet(),
            Text('포인트 내역',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            PointItemBox(),
            PointItemBox(),
            PointItemBox(),
            PointItemBox(),
            PointItemBox(),
          ],
        ),
      ),
    );
  }
}
