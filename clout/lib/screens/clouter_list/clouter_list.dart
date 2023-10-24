import 'package:flutter/material.dart';
import '../../widgets/category_list.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/search_detail_button.dart';
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
      body: Column(
        children: [
          MySearchBar(), // 검색바 위젯 추가
          CategoryList(), // Category 위젯 추가
          SearchDetailButton(), // 검색 조건 설정 버튼
        ],
      ),
    );
  }
}
