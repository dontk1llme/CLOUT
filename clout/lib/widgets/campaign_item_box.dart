import 'package:flutter/material.dart';
import '../style.dart' as style;

class CampaignItemBox extends StatelessWidget {
  const CampaignItemBox({super.key});

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
            Image.asset(
              'assets/images/itemImage.jpg',
              width: 180,
              height: 140,
              fit: BoxFit.cover, // 이미지를 화면에 맞춤(이 코드 없애면 기존 사진 사이즈대로 보임)
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text('카테고리',
                        style: TextStyle(
                          backgroundColor: style.colors['category'],
                          height: 2,
                        )),
                  ),
                  Text('2명 / 3명',
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ],
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
