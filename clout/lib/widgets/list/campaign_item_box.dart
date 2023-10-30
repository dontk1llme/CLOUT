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

    final boxWidth = screenWidth * 0.4;
    final boxPadding = screenWidth * 0.03;
    final imageSize = screenWidth * 0.32;
    final titleFontSize = screenWidth * 0.046;
    final adPriceFontSize = screenWidth * 0.04;
    final companyInfoFontSize = screenWidth * 0.033;
    final starIconSize = screenWidth * 0.04;
    final ratingFontSize = screenWidth * 0.03;

    return InkWell(
      // 여기 arguments에 해당 캠페인의 id를 넣어야 함 
      onTap: ()=>Get.toNamed('/campaignDetail', arguments: 1),
        child: Container(
      width: boxWidth,
      padding: EdgeInsets.all(boxPadding),
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
                width: boxWidth,
                height: imageSize,
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
                fontSize: titleFontSize,
              )),
          Text('광고비',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: style.colors['main1'],
                fontWeight: FontWeight.w500,
                fontSize: adPriceFontSize,
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('업체명',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: companyInfoFontSize,
                  )),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: starIconSize,
              ),
              Text('20.5',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: ratingFontSize,
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
