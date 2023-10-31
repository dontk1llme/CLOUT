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

class AdvertiserMycampaign extends StatelessWidget {
  const AdvertiserMycampaign({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '내 캠페인 목록',
          ),
        ),
        body: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: BouncingListview(
              child: FractionallySizedBox(
                  widthFactor: screenWidth > 400 ? 0.9 : 1,
                  child: Column(
                    children: [
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
                                CampaignItemBox(),
                                CampaignItemBox(),
                                CampaignItemBox(),
                                CampaignItemBox(),
                                CampaignItemBox(),
                                CampaignItemBox(),
                                CampaignItemBox(),
                                CampaignItemBox(),
                                CampaignItemBox(),
                              ])),
                      SizedBox(height: 30)
                    ],
                  )),
            )));
  }
}
