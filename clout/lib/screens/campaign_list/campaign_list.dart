import 'package:flutter/material.dart';
import '../../widgets/category_list.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/header/header.dart';
import '../../style.dart' as style;

class CampaignList extends StatefulWidget {
  const CampaignList({super.key});

  @override
  State<CampaignList> createState() => _MyCampaignList();
}

class _MyCampaignList extends State<CampaignList> {
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
          MySearchBar(),
          CategoryList(), // Category 위젯 추가
        ],
      ),
    );
  }
}
