import 'package:clout/providers/region_controller.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/search_detail_bottom_sheet/search_detail_button.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/list/category_list.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';
import 'package:clout/widgets/input/search_bar.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:get/get.dart';

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

class ClouterList extends StatefulWidget {
  ClouterList({super.key});

  @override
  State<ClouterList> createState() => _ClouterList();
}

class _ClouterList extends State<ClouterList> {
  // repeatItem() {
  //   var items = [];
  //   for (int i = 0; i < 20; i++) {
  //     items.add(ClouterItemBox());
  //   }
  //   return items.toList();
  // }
  Clouter clouter = Clouter();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
          style.colors['white'], // 기본 backgroundColor 밝은 회색이길래 넣은 코드
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 1,
            headerTitle: '클라우터 목록',
          )),
      body: BouncingListview(
        child: Column(
          children: [
            MySearchBar(), // 검색바 위젯 추가
            CategoryList(), // Category 위젯 추가
            SearchDetailButton(), // 검색 조건 설정 버튼
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // 가장 왼쪽으로 정렬
                children: <Widget>[
                  Text(
                    '전체보기',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: screenWidth > 400 ? 0.9 : 1,
              child: Align(
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
                      firstImg: clouter.firstImg,
                    ),
                    ClouterItemBox(
                      nickname: clouter.nickname,
                      starRating: clouter.starRating,
                      fee: clouter.fee,
                      category: clouter.category,
                      contractCount: clouter.contractCount,
                      selectedPlatform: clouter.selectedPlatform,
                      firstImg: clouter.firstImg,
                    ),
                    ClouterItemBox(
                      nickname: clouter.nickname,
                      starRating: clouter.starRating,
                      fee: clouter.fee,
                      category: clouter.category,
                      contractCount: clouter.contractCount,
                      selectedPlatform: clouter.selectedPlatform,
                      firstImg: clouter.firstImg,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
