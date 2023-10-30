// 계약서 리스트에 들어갈 컴포넌트
import 'package:clout/screens/join/widgets/small_button.dart';
import 'package:clout/screens/mypage/widgets/contract.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/buttons/like_button.dart';

class SmallContract extends StatefulWidget {
  const SmallContract({super.key});

  @override
  State<SmallContract> createState() => _SmallContractState();
}

class _SmallContractState extends State<SmallContract> {
  bool isItemLiked = false;

  void handleItemTap() {
    setState(() {
      isItemLiked = !isItemLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final boxWidth = screenWidth;
    final boxPadding = screenWidth > 400 ? 12.0 : 10.0;

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '못골영농조합법인',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth > 400 ? 19 : 17,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.card_giftcard,
                            color: style.colors['main1'],
                            size: screenWidth > 400 ? 18 : 15,
                          ),
                          Text(
                            '제공내역 ',
                            style: TextStyle(
                              fontSize: screenWidth > 400 ? 14 : 11,
                            ),
                          ),
                          Text(
                            '1000 포인트',
                            style: TextStyle(
                              fontSize: screenWidth > 400 ? 15 : 13,
                              fontWeight: FontWeight.w600,
                              color: style.colors['main1'],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 10, // 조절하여 원하는 위치로 이동할 수 있습니다.
                child: SmallButton(
                  title: "계약서",
                  function: () {
                    Get.to(Contract());
                  },
                ),
              ),
            ],
          )



          
        ],
      ),
    );
  }
}
