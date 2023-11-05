import 'package:clout/main.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/screens/apply_campaign/apply_campaign.dart';
import 'package:clout/screens/campaign_detail/widgets/campaign_detail_content.dart';
import 'package:clout/screens/campaign_detail/widgets/campaign_detail_delivery_info.dart';
import 'package:clout/screens/campaign_detail/widgets/campaign_detail_info_box.dart';
import 'package:clout/screens/clouter/clouter_select.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;
import 'package:carousel_slider/carousel_slider.dart';

class Campaign {
  int campaignId = 1;
  String category = '카테고리';
  String productName = '못골정미소 백미 5kg';
  String campaignSubject = '못골영농조합법인';
  String preferredPlatform = '인스타그램/유튜브/틱톡';
  String endDate = '2023.10.29(일)';
  int applicantCount = 2;
  int recruitCount = 5;
  int pay = 1000;
  List<String> selectedRegions = [];
  String offeringItems = '클라우터에게 배송';
  String itemDetail = '1. 못골 정미소 백미 5kg \n2. 광고비 1000포인트';
  String requirements = '잘 부탁드립니다~~';
  int starRating = 20;
}

final List<String> imgList = [
  'assets/images/main_carousel_1.jpg',
  'assets/images/itemImage.jpg',
  'assets/images/clouterImage.jpg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Padding(
          padding: const EdgeInsets.all(0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.asset(item, fit: BoxFit.cover)),
        ))
    .toList();

String caution = '법적 고지, 책임은 계약 당사자 간 있다, 등등...';

//////////////////////////////////////////////////////////////////////////////

class CampaignDetail extends StatelessWidget {
  CampaignDetail({super.key});

  // campaignId GetX에서 argument로 얻어서 api 통신으로 어떤 캠페인 정보 보여줄지 표시해야함
  var campaignId = Get.arguments;

  Campaign campaign = Campaign();

  // GetX Controller에 클라우터인지 광고주인지 저장해놓고(리코일처럼)
  // 버튼 다르게 보이게 해야함
  final userController = Get.find<UserController>();

  showBottomSheet() {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        height: 180,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('수정하기'),
              onTap: () {},
            ),
            Container(color: Colors.grey, width: double.infinity, height: 0.5),
            ListTile(
              leading: Icon(Icons.delete_forever_rounded),
              title: Text('삭제하기'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.colors['white'],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 3,
          headerTitle: campaign.productName,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            BouncingListview(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    // 사진 캐러셀
                    ImageCarousel(
                        imageSliders: imageSliders,
                        aspectRatio: 1.2,
                        enlarge: true),
                    SizedBox(height: 20),
                    // 캠페인 정보 상자
                    CampaignDetailInfoBox(campaign: campaign),
                    SizedBox(height: 20),
                    // 배송 여부 상자
                    CampaignDetailDeliveryInfo(),
                    CampaignDetailContent(
                      title: '협찬 제공 방법',
                      content: Text(
                        campaign.offeringItems,
                        style: style.textTheme.bodyLarge,
                      ),
                    ),
                    CampaignDetailContent(
                      title: '제공 내역',
                      content: Text(
                        campaign.itemDetail,
                        style: style.textTheme.bodyLarge,
                      ),
                    ),
                    CampaignDetailContent(
                      title: '요구사항',
                      content: Text(
                        campaign.requirements,
                        style: style.textTheme.bodyLarge,
                      ),
                    ),
                    CampaignDetailContent(
                      title: '주의사항',
                      content: Text(
                        caution,
                        style: style.textTheme.bodyLarge,
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            userController.user == -1
                ? Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: SizedBox(
                      height: 50,
                      child: BigButton(
                        title:
                            '신청하기', // 이미 지원한 캠페인일 경우 title 다르게 설정하고 버튼 비활성화 해야함
                        function: () => Get.to(ApplyCampaign()),
                      ),
                    ),
                  )
                : userController.user == 1
                    ? Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: SizedBox(
                                height: 50,
                                child: BigButton(
                                  title: '신청자 목록보기',
                                  function: () => Get.to(
                                    () => ClouterSelect(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  // 편집 삭제 bottomSheetModal 띄우는 함수 넣어야 함
                                  onPressed: showBottomSheet,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: style.colors['category'],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(0),
                                  ),
                                  child: Icon(
                                    Icons.more_vert_outlined,
                                    color: style.colors['main1'],
                                    size: 30,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}
