import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// screens
import 'package:clout/screens/clouter/clouter_detail.dart';

// widgets
import 'package:clout/widgets/buttons/like_button.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:clout/widgets/sns/sns2.dart';

class ClouterItemBox extends StatefulWidget {
  const ClouterItemBox({super.key});

  @override
  State<ClouterItemBox> createState() => _ClouterItemBoxState();
}

class _ClouterItemBoxState extends State<ClouterItemBox> {
  bool isItemLiked = false;

  void handleItemTap() {
    setState(() {
      isItemLiked = !isItemLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxWidth = screenWidth > 400 ? 200.0 : 170.0;
    final boxPadding = screenWidth > 400 ? 12.0 : 10.0;
    final imageSize = screenWidth > 400 ? 160.0 : 140.0;

    return GestureDetector(
      onTap: () {
        Get.to(() => ClouterDetail());
      },
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
                  'assets/images/clouterImage.jpg',
                  width: boxWidth,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 5, // 아래 여백
                  right: 5, // 오른쪽 여백
                  child: Sns2(), // 배치할 위젯
                ),
                LikeButton(isLiked: isItemLiked, onTap: handleItemTap),
              ],
            ),
            NameTag(title: '카테고리'),
            Text(
              '계정명',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: screenWidth > 400 ? 19 : 17,
              ),
            ),
            Text(
              '광고비',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: style.colors['main1'],
                fontWeight: FontWeight.w500,
                fontSize: screenWidth > 400 ? 17 : 15,
              ),
            ),
            Row(
              children: [
                Text(
                  '계약한 광고 수 : ',
                  style: TextStyle(
                    fontSize: screenWidth > 400 ? 15 : 13,
                  ),
                ),
                Text(
                  'N',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth > 400 ? 15 : 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
