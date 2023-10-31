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
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: style.colors['white'],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 1,
            headerTitle: '캠페인 목록',
          ),
        ),
        body: ListView(children: [
          MySearchBar(),
          CategoryList(),
          SearchDetailButton(),
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
          SizedBox(height: 20),
          FractionallySizedBox(
              widthFactor: screenWidth > 400 ? 0.9 : 1,
              child: Align(alignment: Alignment.topCenter, child: Wrap(
                  direction: Axis.horizontal,
                  spacing: screenWidth > 400 ? 20 : 10,
                  runSpacing: screenWidth > 400 ? 20 : 10,
                  // alignment: Alignment.,
                  children: []))),
          SizedBox(height: 30),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
          CampaignItemBox(),
        ]));
  }
}
