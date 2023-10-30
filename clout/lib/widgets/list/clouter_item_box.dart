import 'package:clout/widgets/common/nametag.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// screens
import 'package:clout/screens/clouter/clouter_detail.dart';

// widgets
import 'package:clout/widgets/buttons/like_button.dart';

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
    final boxWidth = screenWidth * 0.4;
    final boxPadding = screenWidth * 0.03;
    final imageSize = screenWidth * 0.32;
    final nameFontSize = screenWidth * 0.046;
    final adFeeFontSize = screenWidth * 0.04;
    final contractInfoFontSize = screenWidth * 0.033;

    return GestureDetector(
      onTap: () {
        Get.to(() => ClouterDetail());
      },
      child: Container(
        width: boxWidth,
        padding: EdgeInsets.all(boxPadding),
        decoration: BoxDecoration(
          color: style.colors['white'],
          borderRadius: BorderRadius.circular(
              screenWidth * 0.025), // 2.5% of screen width
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
                fontSize: nameFontSize,
              ),
            ),
            Text(
              '광고비',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: style.colors['main1'],
                fontWeight: FontWeight.w500,
                fontSize: adFeeFontSize,
              ),
            ),
            Row(
              children: [
                Text(
                  '계약한 광고 수 : ',
                  style: TextStyle(
                    fontSize: contractInfoFontSize,
                  ),
                ),
                Text(
                  'N',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: contractInfoFontSize,
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
