// Global
import 'package:clout/screens/home/widgets/menu_title.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/widgets/buttons/big_button.dart';

// Widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/home/widgets/main_carousel_text1.dart';
import 'package:clout/widgets/buttons/small_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Header(
            header: 0,
          ),
        ),
        body: ListView(
          children: [
            // 여기 아래 컨테이너에 캐러셀 넣어야 함(아래 컨테이너 전체를 캐러셀에 포함시켜야 함)
            Container(
                color: Colors.black,
                height: 200,
                width: double.infinity,
                child: Stack(
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
                        // color: Colors.black,
                        height: 200,
                        alignment: FractionalOffset(0.5, 0.5),
                        child: FractionallySizedBox(
                            widthFactor: 1,
                            heightFactor: 0.7,
                            child: Column(
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
                    SingleChildScrollView(
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        for (num i = 0; i < 10; i++)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: ClouterItemBox(),
                          )
                      ]),
                    )
                  ]),
                  Container(
                    color: style.colors['main3'],
                    height: 10,
                  ),
                  Column(children: [
                    MenuTitle(text: '인기있는 캠페인', destination: 2),
                    SingleChildScrollView(
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        for (num i = 0; i < 10; i++)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: CampaignItemBox(),
                          )
                      ]),
                    )
                  ])
                ],
              ),
            )
          ],
        ));
  }
}
