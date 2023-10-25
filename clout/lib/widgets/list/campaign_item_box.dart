import 'package:flutter/material.dart';
import '../../style.dart' as style;

import '../buttons/like_button.dart';

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
    return Container(
        width: 180,
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
              alignment: Alignment.topRight, // 아이콘을 오른쪽 상단에 배치
              children: [
                Image.asset(
                  'assets/images/clouterImage.jpg',
                  width: 180,
                  height: 140,
                  fit: BoxFit
                      .cover, // 이미지 화면에 맞춤(이거 없애면 기존 사진 사이즈대로 보임.. 원하는대로!)
                ),
                LikeButton(isLiked: isItemLiked, onTap: handleItemTap),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 4),
              child: SizedBox(
                width: 70,
                height: 25,
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
                        )),
                  ),
                ),
              ),
            ),
            Text('제품명',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                )),
            Text('광고비',
                style: TextStyle(
                  color: style.colors['main1'],
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                )),
            Row(children: [
              Text('업체명',
                  style: TextStyle(
                    fontSize: 15,
                  )),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text('20.5',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
            ])
          ],
        ));
  }
}
