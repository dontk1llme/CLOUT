import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// screens
import 'package:clout/screens/detail/clouter/clouter_detail.dart';

// widgets
import 'package:clout/widgets/buttons/like_button.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:clout/widgets/sns/sns2.dart';

class ClouterItemBox extends StatefulWidget {
  final String nickname;
  final int starRating;
  final int fee;
  final String category;
  final int contractCount;
  final List<String> selectedPlatform;
  final String firstImg;

  ClouterItemBox(
      {super.key,
      required this.nickname,
      required this.starRating,
      required this.fee,
      required this.category,
      required this.contractCount,
      required this.selectedPlatform,
      required this.firstImg});

  @override
  State<ClouterItemBox> createState() => _ClouterItemBoxState();
}

class _ClouterItemBoxState extends State<ClouterItemBox> {
  var f = NumberFormat('###,###,###,###');

  bool isItemLiked = false;

  void handleItemTap() {
    setState(() {
      isItemLiked = !isItemLiked;
    });
  }

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Get.to(() => ClouterDetail());
      },
      child: Container(
        width: screenWidth / 2 - 25,
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
                // 제일 큰 이미지
                Image.asset(
                  widget.firstImg,
                  width: screenWidth / 2 - 40,
                  height: screenWidth / 2 - 65,
                  fit: BoxFit.cover,
                ),
                // 이미지에 떠있는 플랫폼 이미지
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: style.colors['white'],
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(children: [
                      Sns2(selectedPlatform: widget.selectedPlatform)
                    ]),
                  ),
                ),
                if (userController.memberType == 1)
                  LikeButton(isLiked: isItemLiked, onTap: handleItemTap),
              ],
            ),
            NameTag(title: widget.category),
            Text(
              widget.nickname,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: screenWidth > 400 ? 17 : 15,
              ),
            ),
            Text(
              '${f.format(widget.fee)} 포인트',
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
                  '${widget.contractCount}건',
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
