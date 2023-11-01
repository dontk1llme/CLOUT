import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:intl/intl.dart';

// widgets
import 'package:clout/widgets/buttons/like_button.dart';
import 'package:get/get.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:clout/widgets/sns/sns2.dart';

class CampaignItemBox extends StatefulWidget {
  final String category;
  final String productName;
  final int pay;
  final String campaignSubject;
  final int applicantCount;
  final int recruitCount;
  final List<String> selectedPlatform;
  final int starRating;
  final String firstImg;

  const CampaignItemBox({
    super.key,
    required this.category,
    required this.productName,
    required this.pay,
    required this.campaignSubject,
    required this.applicantCount,
    required this.recruitCount,
    required this.selectedPlatform,
    required this.starRating,
    required this.firstImg,
  });

  @override
  State<CampaignItemBox> createState() => _CampaignItemBoxState();
}

class _CampaignItemBoxState extends State<CampaignItemBox> {
  var f = NumberFormat('###,###,###,###');

  bool isItemLiked = false;

  void handleItemTap() {
    setState(() {
      isItemLiked = !isItemLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
        // 여기 arguments에 해당 캠페인의 id를 넣어야 함
        onTap: () => Get.toNamed('/campaignDetail', arguments: 1),
        child: Container(
          width: 170,
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
                  Image.asset(
                    'assets/images/itemImage.jpg',
                    width: 170,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
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
                  LikeButton(isLiked: isItemLiked, onTap: handleItemTap),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NameTag(title: widget.category),
                  Text('${widget.applicantCount}명 / ${widget.recruitCount}명',
                      style: TextStyle(
                        fontSize: 12,
                      )),
                ],
              ),
              Text(widget.productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth > 400 ? 17 : 15,
                  )),
              Text('${f.format(widget.pay)} 포인트',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: style.colors['main1'],
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth > 400 ? 17 : 15,
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(widget.campaignSubject,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: screenWidth > 400 ? 13 : 11,
                        )),
                  ),
                  Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: screenWidth > 400 ? 18 : 15,
                          ),
                          Text(widget.starRating.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth > 400 ? 13 : 11,
                              )),
                        ],
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
