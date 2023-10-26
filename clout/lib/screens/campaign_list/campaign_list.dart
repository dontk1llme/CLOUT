import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:syncfusion_flutter_sliders/sliders.dart';

// widgets
import 'package:clout/widgets/list/category_list.dart';
import 'package:clout/widgets/input/search_bar.dart';
import 'package:clout/widgets/buttons/search_detail_button.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:clout/widgets/header/header.dart';

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
      backgroundColor: style.colors['white'],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 1,
          headerTitle: '캠페인 목록',
        ),
      ),
      body: ListView(
        children: [
          MySearchBar(),
          CategoryList(),
          SearchDetailButton(
            ageRanges: ageRanges,
            setAge: setAge,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
          Container(
            padding: EdgeInsets.all(15), // 가로 패딩 설정
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 한 행에 2개의 아이템 배치
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.45,
              ),
              itemCount: 20, // 아이템의 개수
              itemBuilder: (BuildContext context, int index) {
                return CampaignItemBox();
              },
              shrinkWrap: true, // 필요한 경우 스크롤을 가능하게 함
              physics: NeverScrollableScrollPhysics(), // 스크롤 방지
            ),
          ),
        ],
      ),
    );
  }
}
