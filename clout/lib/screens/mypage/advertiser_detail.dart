import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/screens/mypage/widgets/content_text.dart';
import 'package:clout/screens/mypage/widgets/gray_title.dart';
import 'package:clout/screens/mypage/widgets/info_item_box.dart';
import 'package:clout/screens/mypage/widgets/update_button.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';

class AdvertiserDetail extends StatelessWidget {
  const AdvertiserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '내 프로필',
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
                          children: [
                            Text('회원 정보',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            // 회원 정보 수정 버튼 위젯 삽입
                            UpdateButton(),
                          ],
                        ),
                      ),
                      Divider(
                          thickness: 1,
                          height: 1,
                          color: style.colors['lightgray']),
                      Column(
                        children: [
                          InfoItemBox(titleName: '사업자명', contentInfo: 'CLOUT'),
                          InfoItemBox(
                              titleName: '사업자등록번호',
                              contentInfo: '123-45-677890'),
                          InfoItemBox(
                              titleName: '소재지 주소',
                              contentInfo: '서울시 강남구 테헤란로 212'),
                          InfoItemBox(
                              titleName: '업체 연락처', contentInfo: '02-3429-5100'),
                          InfoItemBox(titleName: '담당자명', contentInfo: '김보연'),
                          InfoItemBox(
                              titleName: '담당자 이메일',
                              contentInfo: 'kkbbyy1113@gmail.com'),
                          InfoItemBox(
                              titleName: '담당자 연락처',
                              contentInfo: '010-1234-5678'),
                        ],
                      ),
                    ],
                  )),
            )));
  }
}
