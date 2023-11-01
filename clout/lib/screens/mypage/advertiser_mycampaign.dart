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

class Campaign {
  int campaignId = 1;
  String category = '음식';
  String productName = '못골정미소 백미 5kg';
  int pay = 1000;
  String campaignSubject = '못골영농조합법인';
  int applicantCount = 2;
  int recruitCount = 5;
  List<String> selectedPlatform = [
    "YouTube",
    // "Instagram",
    "TikTok",
  ];
  int starRating = 20;
  String firstImg = 'assets/images/itemImage.jpg';
}

class AdvertiserMycampaign extends StatelessWidget {
  AdvertiserMycampaign({super.key});

  Campaign campaign = Campaign();

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
                            Row(
                              children: [
                                Icon(Icons.filter_list, size: 20),
                                Text('정렬'),
                              ],
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
                                CampaignItemBox(
                                  category: campaign.category,
                                  productName: campaign.productName,
                                  pay: campaign.pay,
                                  campaignSubject: campaign.campaignSubject,
                                  applicantCount: campaign.applicantCount,
                                  recruitCount: campaign.recruitCount,
                                  selectedPlatform: campaign.selectedPlatform,
                                  starRating: campaign.starRating,
                                  firstImg: campaign.firstImg,
                                ),
                                CampaignItemBox(
                                  category: campaign.category,
                                  productName: campaign.productName,
                                  pay: campaign.pay,
                                  campaignSubject: campaign.campaignSubject,
                                  applicantCount: campaign.applicantCount,
                                  recruitCount: campaign.recruitCount,
                                  selectedPlatform: campaign.selectedPlatform,
                                  starRating: campaign.starRating,
                                  firstImg: campaign.firstImg,
                                ),
                                CampaignItemBox(
                                  category: campaign.category,
                                  productName: campaign.productName,
                                  pay: campaign.pay,
                                  campaignSubject: campaign.campaignSubject,
                                  applicantCount: campaign.applicantCount,
                                  recruitCount: campaign.recruitCount,
                                  selectedPlatform: campaign.selectedPlatform,
                                  starRating: campaign.starRating,
                                  firstImg: campaign.firstImg,
                                ),
                              ])),
                      SizedBox(height: 30)
                    ],
                  )),
            )));
  }
}
