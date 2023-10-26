import 'package:clout/widgets/buttons/like_button.dart';
import 'package:flutter/material.dart';
import '../../style.dart' as style;
import 'package:get/get.dart';

// screens
import 'package:clout/screens/clouter/clouter_detail.dart';

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

    return GestureDetector(
      onTap: () {
        Get.to(() => ClouterDetail()); // ClouterDetail 페이지로 이동
      },
      child: Container(
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
                padding: EdgeInsets.only(top: 5),
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
              Text('계정명',
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
                Text('계약한 광고 수 : ',
                    style: TextStyle(
                      fontSize: 15,
                    )),
                Text('N',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
              ])
            ],
          )),
    );
  }
}
