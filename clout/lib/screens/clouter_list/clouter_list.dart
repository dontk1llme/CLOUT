import 'package:flutter/material.dart';
import '../../widgets/list/category_list.dart';
import '../../widgets/list/clouter_item_box.dart';
import '../../widgets/input/search_bar.dart';
import '../../widgets/buttons/search_detail_button.dart';
import '../../widgets/header/header.dart';
import '../../style.dart' as style;

class ClouterList extends StatefulWidget {
  const ClouterList({super.key});

  @override
  State<ClouterList> createState() => _MyClouterList();
}

class _MyClouterList extends State<ClouterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          style.colors['white'], // 기본 backgroundColor 밝은 회색이길래 넣은 코드
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 1,
            headerTitle: '클라우터 목록',
          )),
      body: ListView(
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
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClouterItemBox(),
                ClouterItemBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
