import 'package:clout/screens/detail/campaign/widgets/campaign_detail_visit.dart';
import 'package:clout/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

// api
import 'dart:convert';
import 'package:clout/type.dart';
import 'package:clout/utilities/like_utils.dart';
import 'package:clout/hooks/apis/normal_api.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';

// widgets
import 'package:clout/screens/detail/campaign/widgets/campaign_detail_content.dart';
import 'package:clout/screens/detail/campaign/widgets/campaign_detail_delivery_info.dart';
import 'package:clout/screens/detail/campaign/widgets/campaign_detail_info_box.dart';
import 'package:clout/screens/clouter_select/clouter_select.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/widgets/buttons/like_button.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/image_carousel.dart';
import 'package:loading_indicator/loading_indicator.dart';

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

String caution =
    '✔ 리뷰 작성기간 미준수시 패널티(제품 비용, 체험 비용 환불 등) 및 계약서에 의거 법적 처벌을 받을 수 있습니다.\n✔ 캠페인 요구사항 및 가이드라인을 확인해서 작성해주시기 바랍니다.\n✔ 수집된 개인정보는 체험단 운영 및 경품 증정 등의 필수 목적으로 사용되고 그 외에 목적으로는 사용되지 않습니다.\n✔ 작성해 주신 리뷰/포스팅/콘텐츠는 최소 6개월 이상 유지를 원칙으로 합니다.\n✔ 제품 발송은 최초 가입 시 등록한 주소지로 발송됩니다.\n✔ 주소 이전 시 회원 정보 미반영으로 인한 피해는 당사에서 책임지지 않습니다.';

//////////////////////////////////////////////////////////////////////////////

class CampaignDetail extends StatefulWidget {
  CampaignDetail({super.key});

  @override
  State<CampaignDetail> createState() => _CampaignDetailState();
}

class _CampaignDetailState extends State<CampaignDetail> {
  CampaignInfo? campaignInfo;
  AdvertiserInfo? advertiserInfo;
  bool isLoading = true;
  bool isItemLiked = false;

  @override
  void initState() {
    super.initState();
    _showDetail();
  }

  final userController = Get.find<UserController>();

  var campaignId = Get.arguments; // campaign_item_box에서 argument 가져오기

  _showDetail() async {
    // item 정보 api 호출
    final NormalApi api = NormalApi();

    try {
      var response = await api.getRequest(
          '/advertisement-service/v1/advertisements/', campaignId);
      // reponse = {'statusCode' : 값, 'body' : 값}
      print(response['body']);
      int statusCode =
          response['statusCode']; // statusCode에 따라 다르게 결과 나오게 하는거 이걸로 처리

      final decodedResponse = jsonDecode(response['body']);
      // 데이터를 모델 클래스에 매핑
      setState(() {
        campaignInfo = CampaignInfo.fromJson(decodedResponse['campaignInfo']);
        advertiserInfo =
            AdvertiserInfo.fromJson(decodedResponse['advertiserInfo']);
        isLoading = false;
      });
      print(CampaignList.fromJson(jsonDecode(response)));
      print(CampaignList.fromJson(jsonDecode(response)).advertiserInfo);
    } catch (e) {
      // 에러 처리
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

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
          headerTitle: campaignInfo?.title,
        ),
      ),
      body: isLoading
          ? SizedBox(
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    left: 160,
                    right: 160,
                    top: 0,
                    bottom: 280,
                    child: SizedBox(
                      height: 100,
                      child: LoadingWidget(),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 100,
                    child: Align(
                      child: Text(
                        '캠페인 정보를 불러오는 중입니다.\n잠시만 기다려 주세요',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(
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
                          userController.memberType == 0
                              ? SizedBox(height: 20)
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Like'),
                                    LikeButton(
                                      isLiked: isItemLiked,
                                      onTap: () {
                                        setState(() {
                                          isItemLiked = !isItemLiked;
                                        });
                                        if (campaignInfo != null &&
                                            campaignInfo!.campaignId != null) {
                                          sendLikeStatus(
                                            userController.memberId,
                                            campaignInfo!.campaignId!,
                                            isItemLiked,
                                            false,
                                          );
                                        } else {
                                          print("Campaign 정보 에러 ❌ ");
                                        }
                                      },
                                    )
                                  ],
                                ),
                          // 사진 캐러셀
                          ImageCarousel(
                              imageSliders: imageSliders,
                              aspectRatio: 1.2,
                              enlarge: true),
                          SizedBox(height: 20),
                          // 캠페인 정보 상자
                          if (campaignInfo != null && advertiserInfo != null)
                            CampaignDetailInfoBox(
                                campaignInfo: campaignInfo!,
                                advertiserInfo: advertiserInfo!),
                          SizedBox(height: 20),
                          campaignInfo!.isDeliveryRequired!
                              ? CampaignDetailContent(
                                  title: '협찬 제공 방법',
                                  content: CampaignDetailDeliveryInfo())
                              : CampaignDetailContent(
                                  title: '협찬 제공 방법',
                                  content: CampaignDetailVisit()),
                          CampaignDetailContent(
                            title: '제공 내역',
                            content: Text(
                              campaignInfo!.details!,
                              style: style.textTheme.bodyLarge,
                            ),
                          ),
                          CampaignDetailContent(
                            title: '요구사항',
                            content: Text(
                              campaignInfo!.offeringDetails!,
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
                  userController.memberType == -1
                      ? Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: SizedBox(
                            height: 50,
                            child: BigButton(
                              title:
                                  '신청하기', // 이미 지원한 캠페인일 경우 title 다르게 설정하고 버튼 비활성화 해야함
                              function: () => Get.toNamed('/applycampaign',
                                  arguments: campaignInfo?.campaignId),
                            ),
                          ),
                        )
                      : userController.memberType == 1
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
                                        function: () => Get.toNamed(
                                            '/clouterselect',
                                            arguments: campaignId),
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
                                          backgroundColor:
                                              style.colors['category'],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
