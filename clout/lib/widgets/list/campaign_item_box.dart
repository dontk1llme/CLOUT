import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/type.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';

// widgets
import 'package:clout/widgets/buttons/like_button.dart';
import 'package:get/get.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:clout/widgets/sns/sns2.dart';

class CampaignItemBox extends StatefulWidget {
  final String adCategory;
  final String title;
  final int price;
  final CompanyInfo companyInfo;
  final int numberOfSelectedMembers;
  final int numberOfRecruiter;
  final List<dynamic> adPlatformList;
  final AdvertiserInfo advertiserInfo;
  // final String firstImg;

  const CampaignItemBox({
    super.key,
    required this.adCategory,
    required this.title,
    required this.price,
    required this.companyInfo,
    required this.numberOfSelectedMembers,
    required this.numberOfRecruiter,
    required this.adPlatformList,
    required this.advertiserInfo,
    // required this.firstImg,
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

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
        // 여기 arguments에 해당 캠페인의 id를 넣어야 함
        onTap: () => Get.toNamed('/campaignDetail', arguments: 1),
        child: Container(
          width: screenWidth / 2 - 25,
          // height: 100,
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
                  // Image.asset(
                  //   widget.firstImg, // 💥 사진 수정하기
                  //   width: screenWidth / 2 - 40,
                  //   // height: screenHeight / 2 - 65,
                  //   fit: BoxFit.cover,
                  // ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: style.colors['white'],
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(children: [
                        Sns2(selectedPlatform: widget.adPlatformList)
                      ]),
                    ),
                  ),
                  if (userController.user != 0)
                    LikeButton(isLiked: isItemLiked, onTap: handleItemTap),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NameTag(title: widget.adCategory),
                  Text(
                      '${widget.numberOfSelectedMembers}명 / ${widget.numberOfRecruiter}명',
                      style: TextStyle(
                        fontSize: 12,
                      )),
                ],
              ),
              Text(widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth > 400 ? 17 : 15,
                  )),
              Text('${f.format(widget.price)} 포인트',
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
                    flex: 2,
                    child: Text('',
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
                          Text(
                              widget.advertiserInfo.advertiserAvgStar
                                  .toString(),
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
