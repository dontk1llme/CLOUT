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
  @override
  Widget build(BuildContext context) {
    bool isItemLiked = false;

    void handleItemTap() {
      setState(() {
        isItemLiked = !isItemLiked;
      });
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final boxWidth = screenWidth > 400 ? 200.0 : 165.0;
    final boxPadding = screenWidth > 400 ? 12.0 : 10.0;
    final imageSize = screenWidth > 400 ? 160.0 : 130.0;
    final categoryNameWidth = screenWidth > 400 ? 70.0 : 55.0;
    final categoryNameHeight = screenWidth > 400 ? 30.0 : 20.0;
    final nameFontSize = screenWidth > 400 ? 19.0 : 17.0;
    final adFeeFontSize = screenWidth > 400 ? 17.0 : 15.0;

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
                    child: Text(
                      '카테고리',
                      style: TextStyle(
                        color: style.colors['white'],
                        fontWeight: FontWeight.w700,
                        fontSize: categoryNameHeight - 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              '계정명',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: nameFontSize,
              ),
            ),
            Text(
              '광고비',
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
                    fontSize: screenWidth > 400 ? 15 : 13,
                  ),
                ),
                Text(
                  'N',
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
