// 계약서 목록
import 'package:clout/widgets/common/choicechip.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/mypage/widgets/small_contract.dart';

class Contract {
  int contractId = 1;
  String name = '못골영농조합법인';
  String pay = '1,000 포인트'; // 포인트 또는 제공물품
}

class ContractList extends StatelessWidget {
  const ContractList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '내 계약서 목록',
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: BouncingListview(
            child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  children: [
                    ActionChoiceExample(
                      labels: ['전체 내역', '서명 대기', '진행중', '계약 만료'],
                      chipCount: 4,
                    ),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: 10,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Padding(
                    //       padding: EdgeInsets.symmetric(vertical: 7),
                    //       child: SmallContract(),
                    //     );
                    //   },
                    // ),
                    SmallContract(),
                    SmallContract(),
                    SmallContract(),
                    SmallContract(),
                    SmallContract(),
                    SmallContract(),
                    SmallContract(),
                    SmallContract(),
                    SmallContract(),
                    SmallContract(),
                    SmallContract(),
                  ],
                )),
          ),
        ));
  }
}
