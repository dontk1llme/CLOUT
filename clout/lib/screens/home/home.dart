// Global
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// Screens
import 'package:clout/screens/home/widgets/menu_title.dart';

// Widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/home/widgets/main_carousel_text1.dart';
import 'package:clout/widgets/buttons/small_button.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';

class Clouter {
  int clouterId = 1;
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

class Campaign {
  int campaignId = 1;
  String category = '음식';
  String productName = '못골정미소 백미 5kg';
  int pay = 1000;
  String campaignSubject = '못골영농조합법인';
  int applicantCount = 2;
  int recruitCount = 5;
  List<String> selectedPlatform = [
    "YouTube",
    // "Instagram",
    "TikTok",
  ];
  int starRating = 20;
  String firstImg = 'assets/images/itemImage.jpg';
}

class Home extends StatelessWidget {
  Home({super.key});

  List<String> imgList = [
    'assets/images/main_carousel_1.jpg',
    'assets/images/clouterImage.jpg',
    'assets/images/itemImage.jpg',
    'assets/images/food.png',
  ];
  Clouter clouter = Clouter();
  Campaign campaign = Campaign();

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Header(
            header: 0,
          ),
        ),
        body: BouncingListview(
            child: Column(
          children: [
            // 여기 아래 컨테이너에 캐러셀 넣어야 함(아래 컨테이너 전체를 캐러셀에 포함시켜야 함)
            Container(
                color: Colors.black,
                // height: 200,
                width: double.infinity,
                child: ImageCarousel(
                  imageSliders: carouselList,
                  aspectRatio: 0,
                  enlarge: false,
                )),
            Container(
              color: style.colors['white'],
              child: Column(
                children: [
                  Column(children: [
                    MenuTitle(
                      text: '인기있는 클라우터',
                      destination: 1,
                    ),
                    BouncingListview(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Row(children: [
                          for (num i = 0; i < 10; i++)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                              child: ClouterItemBox(
                                  nickname: clouter.nickname,
                                  starRating: clouter.starRating,
                                  fee: clouter.fee,
                                  category: clouter.category,
                                  contractCount: clouter.contractCount,
                                  selectedPlatform: clouter.selectedPlatform,
                                  firstImg: clouter.firstImg),
                            )
                        ]),
                      ),
                    )
                  ]),
                  Container(
                    color: style.colors['main3'],
                    height: 10,
                  ),
                  Column(children: [
                    MenuTitle(text: '인기있는 캠페인', destination: 2),
                    BouncingListview(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Row(children: [
                          for (num i = 0; i < 10; i++)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                              child: CampaignItemBox(
                                category: campaign.category,
                                productName: campaign.productName,
                                pay: campaign.pay,
                                campaignSubject: campaign.campaignSubject,
                                applicantCount: campaign.applicantCount,
                                recruitCount: campaign.recruitCount,
                                selectedPlatform: campaign.selectedPlatform,
                                starRating: campaign.starRating,
                                firstImg: campaign.firstImg,
                              ),
                            )
                        ]),
                      ),
                    )
                  ])
                ],
              ),
            )
          ],
        )));
  }
}
