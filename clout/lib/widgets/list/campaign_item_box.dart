import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:intl/intl.dart';

// widgets
import 'package:clout/widgets/buttons/like_button.dart';
import 'package:get/get.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:clout/widgets/sns/sns2.dart';

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

class CampaignItemBox extends StatefulWidget {
  const CampaignItemBox({super.key});

  @override
  State<CampaignItemBox> createState() => _CampaignItemBoxState();
}

class _CampaignItemBoxState extends State<CampaignItemBox> {
  var campaignId = Get.arguments;

  Campaign campaign = Campaign();

  var f = NumberFormat('###,###,###,###');

  bool isItemLiked = false;

  void handleItemTap() {
    setState(() {
      isItemLiked = !isItemLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
        // 여기 arguments에 해당 캠페인의 id를 넣어야 함
        onTap: () => Get.toNamed('/campaignDetail', arguments: 1),
        child: Container(
          width: 170,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: style.colors['white'],
            borderRadius: BorderRadius.circular(10),
            boxShadow: style.shadows['shadow'],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    'assets/images/itemImage.jpg',
                    width: 170,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: style.colors['white'],
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(children: [
                        Sns2(selectedPlatform: campaign.selectedPlatform)
                      ]),
                    ),
                  ),
                  LikeButton(isLiked: isItemLiked, onTap: handleItemTap),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NameTag(title: campaign.category),
                  Text(
                      '${campaign.applicantCount}명 / ${campaign.recruitCount}명',
                      style: TextStyle(
                        fontSize: 12,
                      )),
                ],
              ),
              Text(campaign.productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth > 400 ? 17 : 15,
                  )),
              Text('${f.format(campaign.pay)} 포인트',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: style.colors['main1'],
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth > 400 ? 17 : 15,
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(campaign.campaignSubject,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: screenWidth > 400 ? 13 : 11,
                        )),
                  ),
                  Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: screenWidth > 400 ? 18 : 15,
                          ),
                          Text(campaign.starRating.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth > 400 ? 13 : 11,
                              )),
                        ],
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
