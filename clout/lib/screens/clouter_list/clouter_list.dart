import 'package:flutter/material.dart';
import '../../widgets/category_list.dart';
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Header(
            header: 1,
            headerTitle: '캠페인 목록',
          )),
      body: Column(
        children: [
          // Category 위젯 추가
          CategoryList(),
        ],
      ),
    );
  }
}
