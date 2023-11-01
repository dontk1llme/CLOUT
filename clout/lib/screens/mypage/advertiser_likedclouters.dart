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
import 'package:clout/widgets/list/clouter_item_box.dart';

class Clouter {
  int clouterId = 1;
  String nickname = '모카우유';
  int starRating = 20;
  int fee = 500000;
  String category = '반려동물'; // 카테고리는 대표 1개만 받읍시다..
  int contractCount = 5;
  List<String> selectedPlatform = [
    "YouTube",
    "Instagram",
    "TikTok",
  ];
  String firstImg = 'assets/images/clouterImage.jpg';
}

class AdvertiserLikedclouters extends StatelessWidget {
  AdvertiserLikedclouters({super.key});

  Clouter clouter = Clouter();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '관심있는 클라우터 목록',
          ),
        ),
        body: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: BouncingListview(
                child: FractionallySizedBox(
                    widthFactor: screenWidth > 400 ? 0.9 : 1,
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(''),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.filter_list, size: 20),
                                  Text('정렬'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Wrap(
                              direction: Axis.horizontal,
                              spacing: screenWidth > 400 ? 20 : 10,
                              runSpacing: screenWidth > 400 ? 20 : 10,
                              // alignment: Alignment.,
                              children: [
                                ClouterItemBox(
                                    nickname: clouter.nickname,
                                    starRating: clouter.starRating,
                                    fee: clouter.fee,
                                    category: clouter.category,
                                    contractCount: clouter.contractCount,
                                    selectedPlatform: clouter.selectedPlatform,
                                    firstImg: clouter.firstImg),
                              ])),
                      SizedBox(height: 30)
                    ])))));
  }
}
