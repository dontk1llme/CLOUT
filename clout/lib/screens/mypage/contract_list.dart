// 계약서 목록
import 'package:clout/screens/mypage/widgets/contract_toggle.dart';
import 'package:clout/screens/mypage/widgets/small_contract.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/screens/mypage/widgets/content_text.dart';
import 'package:clout/screens/mypage/widgets/gray_title.dart';
import 'package:clout/screens/mypage/widgets/info_item_box.dart';
import 'package:clout/screens/mypage/widgets/update_button.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';

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
        body: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: BouncingListview(
              child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ContractToggle()],
                        ),
                      ),
                      BouncingListview(
                        child: Column(children: [
                          for (num i = 0; i < 10; i++)
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: SmallContract(),
                            ),
                        ]),
                      )
                    ],
                  )),
            )));
  }
}
