import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/buttons/like_button.dart';

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

    final boxWidth = screenWidth > 400 ? 200.0 : 165.0;
    final boxPadding = screenWidth > 400 ? 12.0 : 10.0;
    final imageSize = screenWidth > 400 ? 160.0 : 130.0;
    final categoryNameWidth = screenWidth > 400 ? 70.0 : 55.0;
    final categoryNameHeight = screenWidth > 400 ? 30.0 : 20.0;

    return Container(
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
              LikeButton(isLiked: isItemLiked, onTap: handleItemTap),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 4),
            child: SizedBox(
              width: categoryNameWidth,
              height: categoryNameHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: style.colors['category'],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text('카테고리',
                      style: TextStyle(
                        color: style.colors['white'],
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth > 400 ? 13 : 11,
                      )),
                ),
              ),
            ),
          ),
          Text('제품명',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: screenWidth > 400 ? 19 : 17,
              )),
          Text('광고비',
              style: TextStyle(
                color: style.colors['main1'],
                fontWeight: FontWeight.w500,
                fontSize: screenWidth > 400 ? 17 : 15,
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('업체명',
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
    );
  }
}
