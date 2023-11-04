import 'package:clout/widgets/common/main_drawer.dart';
import 'package:clout/widgets/search_detail_bottom_sheet/search_detail_button.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// widgets
import 'package:clout/widgets/list/category_list.dart';
import 'package:clout/widgets/input/search_bar.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:clout/widgets/header/header.dart';

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

class CampaignList extends StatefulWidget {
  const CampaignList({super.key});

  @override
  State<CampaignList> createState() => _MyCampaignList();
}

class _MyCampaignList extends State<CampaignList> {
  var campaignId = Get.arguments;

  Campaign campaign = Campaign();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: MyDrawer(),
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
        ]));
  }
}
