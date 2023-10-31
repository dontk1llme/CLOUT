import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/screens/mypage/widgets/selected_category.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:clout/widgets/sns/sns3.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/screens/mypage/widgets/content_text.dart';
import 'package:clout/screens/mypage/widgets/gray_title.dart';
import 'package:clout/screens/mypage/widgets/info_item_box.dart';
import 'package:clout/screens/mypage/widgets/update_button.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';

class ClouterDetail extends StatelessWidget {
  const ClouterDetail({super.key});

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
                          InfoItemBox(titleName: '닉네임', contentInfo: '아기파랑새'),
                          InfoItemBox(titleName: '이름', contentInfo: '박재민'),
                          InfoItemBox(titleName: '나이', contentInfo: '27'),
                          InfoItemBox(
                              titleName: '연락처', contentInfo: '010-1234-5678'),
                          InfoItemBox(
                              titleName: '이메일',
                              contentInfo: 'catbirdseat@gmail.com'),
                          InfoItemBox(
                              titleName: '주소', contentInfo: '서울시 강남구 역삼동'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          DataTitle(text: '광고 희망 플랫폼'),
                          SizedBox(height: 10),
                          Sns3(),
                          SizedBox(height: 20),
                          DataTitle(text: '희망 광고비'),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('10만원 ~ 50만원',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: style.colors['main1'],
                                  )),
                              SizedBox(width: 10),
                              Text('points',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(height: 20),
                          DataTitle(text: '희망 카테고리'),
                          Row(
                            children: [
                              SelectedCategory(title: '패션/의류'),
                              SelectedCategory(title: '반려동물')
                            ],
                          ),
                          SizedBox(height: 20),
                          DataTitle(text: '내 사진'),
                          // 등록한 사진 목록...
                        ],
                      )
                    ],
                  )),
            )));
  }
}
