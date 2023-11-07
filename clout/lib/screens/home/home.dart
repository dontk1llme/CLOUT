// Global
import 'dart:convert';
import 'dart:async';
import 'package:clout/type.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:http/http.dart' as http;

// utilities
import 'package:clout/utilities/bouncing_listview.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';

// Screens
import 'package:clout/screens/home/widgets/menu_title.dart';

// Widgets
import 'package:clout/widgets/image_carousel.dart';
import 'package:clout/widgets/common/main_drawer.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/home/widgets/main_carousel_text1.dart';
import 'package:clout/widgets/buttons/small_button.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';
import 'package:get/get.dart';

// Future<Campaign> fetchCampaign() async {
//   final response = await http
//       .get(Uri.parse('http://70.12.247.35:8889/v1/advertisements/top10'));

//   if (response.statusCode == 200) {
//     print('👻✨ response body: ${response.body}');
//     return Campaign.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('캠페인 불러오기 실패 💨');
//   }
// }

// 클라우터 api는 나오는대로...
class Clouter {
  final int clouterId = 1;
  String nickname = '모카우유';
  int starRating = 20;
  int fee = 500000;
  String category = '반려동물';
  int contractCount = 5;
  List<String> selectedPlatform = [
    "YouTube",
    "Instagram",
    "TikTok",
  ];
  String firstImg = 'assets/images/clouterImage.jpg';
}

final userController = Get.find<UserController>();

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Campaign> futureCampaign;
  // late Future<Clouter> futureClouter;

  // @override
  // void initState() {
  //   super.initState();
  //   futureCampaign = fetchCampaign();
  //   // futureClouter = fetchClouter();
  // }

  List<String> imgList = [
    'assets/images/main_carousel_1.jpg',
    'assets/images/clouterImage.jpg',
    'assets/images/itemImage.jpg',
    'assets/images/food.png',
  ];

  Clouter clouter = Clouter();

  // Campaign campaign = Campaign();
  List<Widget> carouselList = [
    Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: Image.asset(
            'assets/images/main_carousel_1.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            alignment: FractionalOffset(0.5, 0.5),
            child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        MainCarouselText1(
                          text: '자신의 콘텐츠와 브랜드와의',
                        ),
                        MainCarouselText1(
                          text: '적합성을 평가하여',
                        ),
                        MainCarouselText1(
                          text: '최적의 계약을 체결해보세요!',
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                          width: 180,
                          child: SmallButton(
                            title: '캠페인 보러가기',
                          )),
                    )
                  ],
                )))
      ],
    ),
    Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: SizedBox(
            child: Image.asset(
              'assets/images/clouterImage.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
            alignment: FractionalOffset(0.5, 0.5),
            child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        MainCarouselText1(
                          text: '자신의 콘텐츠와 브랜드와의',
                        ),
                        MainCarouselText1(
                          text: '적합성을 평가하여',
                        ),
                        MainCarouselText1(
                          text: '최적의 계약을 체결해보세요!',
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                          width: 180,
                          child: SmallButton(
                            title: '캠페인 보러가기',
                          )),
                    )
                  ],
                )))
      ],
    ),
    Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: SizedBox(
            child: Image.asset(
              'assets/images/itemImage.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
            alignment: FractionalOffset(0.5, 0.5),
            child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        MainCarouselText1(
                          text: '자신의 콘텐츠와 브랜드와의',
                        ),
                        MainCarouselText1(
                          text: '적합성을 평가하여',
                        ),
                        MainCarouselText1(
                          text: '최적의 계약을 체결해보세요!',
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                          width: 180,
                          child: SmallButton(
                            title: '캠페인 보러가기',
                          )),
                    )
                  ],
                )))
      ],
    ),
    Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: SizedBox(
            child: Image.asset(
              'assets/images/food.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
            alignment: FractionalOffset(0.5, 0.5),
            child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        MainCarouselText1(
                          text: '자신의 콘텐츠와 브랜드와의',
                        ),
                        MainCarouselText1(
                          text: '적합성을 평가하여',
                        ),
                        MainCarouselText1(
                          text: '최적의 계약을 체결해보세요!',
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                          width: 180,
                          child: SmallButton(
                            title: '캠페인 보러가기',
                          )),
                    )
                  ],
                )))
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 0,
        ),
      ),
      body: BouncingListview(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              // height: 200,
              width: double.infinity,
              child: ImageCarousel(
                imageSliders: carouselList,
                aspectRatio: 0,
                enlarge: false,
              ),
            ),
            Container(
              color: style.colors['white'],
              child: Column(
                children: [
                  Column(
                    children: [
                      MenuTitle(
                        text: '인기있는 클라우터',
                        destination: 1,
                      ),
                      BouncingListview(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: [
                              for (num i = 0; i < 10; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 5, 20),
                                  child: ClouterItemBox(
                                      nickname: clouter.nickname,
                                      starRating: clouter.starRating,
                                      fee: clouter.fee,
                                      category: clouter.category,
                                      contractCount: clouter.contractCount,
                                      selectedPlatform:
                                          clouter.selectedPlatform,
                                      firstImg: clouter.firstImg),
                                )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // Container(
                  //     color: style.colors['main3'],
                  //     height: 10,
                  //     child: FutureBuilder<Campaign>(
                  //       future: futureCampaign,
                  //       builder: (context, snapshot) {
                  //         if (snapshot.hasData) {
                  //           return CampaignItemBox(
                  //             category: snapshot.data!.adCategory,
                  //             productName: snapshot.data!.title,
                  //             pay: snapshot.data!.price,
                  //             campaignSubject: snapshot.data!.companyName,
                  //             applicantCount:
                  //                 snapshot.data!.numberOfSelectedMembers,
                  //             recruitCount: snapshot.data!.numberOfRecruiter,
                  //             selectedPlatform: snapshot.data!.adPlatformList,
                  //             starRating: snapshot.data!.advertiserAvgstar,
                  //             firstImg:
                  //                 'images/assets/itemImage.jpg', // 💥 사진 수정하기
                  //           );
                  //         } else if (snapshot.hasError) {
                  //           return Text('⛔ 캠페인 아이템 에러!! : ${snapshot.error}');
                  //         }
                  //         return const CircularProgressIndicator();
                  //       },
                  //     )),
                  // Column(
                  //   children: [
                  //     MenuTitle(text: '인기있는 캠페인', destination: 2),
                  //     BouncingListview(
                  //       scrollDirection: Axis.horizontal,
                  //       child: Padding(
                  //         padding: EdgeInsets.only(left: 5, right: 5),
                  //         child: Row(
                  //           children: [
                  //             for (num i = 0; i < 10; i++)
                  //               Padding(
                  //                 padding:
                  //                     const EdgeInsets.fromLTRB(5, 10, 5, 20),
                  //                 child: CampaignItemBox(
                  //                   category: campaign.category,
                  //                   productName: campaign.productName,
                  //                   pay: campaign.pay,
                  //                   campaignSubject: campaign.campaignSubject,
                  //                   applicantCount: campaign.applicantCount,
                  //                   recruitCount: campaign.recruitCount,
                  //                   selectedPlatform: campaign.selectedPlatform,
                  //                   starRating: campaign.starRating,
                  //                   firstImg: campaign.firstImg,
                  //                 ),
                  //               )
                  //           ],
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
            userController.user == 0 ? SizedBox(height: 150) : Container(),
          ],
        ),
      ),
    );
  }
}
