import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/buttons/like_button.dart';
import 'package:get/get.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:clout/widgets/sns/sns2.dart';

class CampaignItemBox extends StatefulWidget {
  const CampaignItemBox({super.key});

  @override
  State<CampaignItemBox> createState() => _CampaignItemBoxState();
}

class _CampaignItemBoxState extends State<CampaignItemBox> {
  bool isItemLiked = false;

  void handleItemTap() {
    setState(() {
      isItemLiked = !isItemLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // final boxWidth = screenWidth > 400 ? 200.0 : 170.0;
    // final boxPadding = screenWidth > 400 ? 12.0 : 10.0;
    // final imageSize = screenWidth > 400 ? 160.0 : 140.0;

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
                    child: Sns2(),
                  ),
                  LikeButton(isLiked: isItemLiked, onTap: handleItemTap),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NameTag(title: '카테고리'),
                  Text('2명 / 3명',
                      style: TextStyle(
                        fontSize: 12,
                      )),
                ],
              ),
              Text('제품명',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth > 400 ? 19 : 17,
                  )),
              Text('광고비',
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
                  Text('업체명',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: screenWidth > 400 ? 15 : 13,
                      )),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: screenWidth > 400 ? 18 : 15,
                  ),
                  Text('20.5',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth > 400 ? 14 : 11,
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
