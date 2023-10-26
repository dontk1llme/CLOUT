import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../widgets/list/category_list.dart';
import '../../widgets/input/search_bar.dart';
import '../../widgets/buttons/search_detail_button.dart';
import '../../widgets/list/campaign_item_box.dart';
import '../../widgets/header/header.dart';
import '../../style.dart' as style;

class CampaignList extends StatefulWidget {
  const CampaignList({super.key});

  @override
  State<CampaignList> createState() => _MyCampaignList();
}

class _MyCampaignList extends State<CampaignList> {
  SfRangeValues ageRanges = SfRangeValues(0, 100);

  var minAge;
  var maxAge;

  setAge(input) {
    setState(() {
      ageRanges = input;
      minAge = input.start.toInt();
      maxAge = input.end.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          style.colors['white'], // 기본 backgroundColor 밝은 회색이길래 넣은 코드
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 1,
            headerTitle: '캠페인 목록',
          )),
      body: ListView(
        children: [
          MySearchBar(), // 검색바 위젯 추가
          CategoryList(), // Category 위젯 추가
          SearchDetailButton(
            ageRanges: ageRanges,
            setAge: setAge,
          ), // 검색 조건 설정 버튼
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
                CampaignItemBox(),
                CampaignItemBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
