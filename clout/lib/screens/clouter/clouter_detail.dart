import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// utility
import 'package:clout/utilities/bouncing_listview.dart';

// widgets
import 'package:clout/widgets/sns/widgets/sns_item_box.dart';
import 'package:clout/widgets/image_carousel.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/widgets/buttons/like_button.dart';

// screen
import 'package:clout/screens/chatting/chatting_list.dart';

class Clouter {
  int clouterId = 1;
  String nickname = '모카우유'; // 클라우터 닉네임
  int starRating = 20; // 평점
  int fee = 500000; // 희망 광고비
  List<String> selectedCategories = [
    "반려동물",
    "기타",
  ]; // 희망 카테고리
  int contractCount = 5; // 계약한 광고 수
}

// SNS 정보
class SNSChannel {
  final String snsType; // Youtube · Instagram · TikTok
  final String channelName; // 채널명 · 계정명
  final int followers; // 구독자수 · 팔로워수
  final String link; // sns 링크

  SNSChannel({
    required this.snsType,
    required this.channelName,
    required this.followers,
    required this.link,
  });
}

// 클라우터 사진들
List<String> imgList = [
  'assets/images/clouterImage.jpg',
  'assets/images/main_carousel_1.jpg',
  'assets/images/itemImage.jpg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Padding(
          padding: const EdgeInsets.all(0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.asset(item, fit: BoxFit.cover)),
        ))
    .toList();

class ClouterDetail extends StatefulWidget {
  const ClouterDetail({super.key});

  @override
  State<ClouterDetail> createState() => _ClouterDetailState();
}

class _ClouterDetailState extends State<ClouterDetail> {
  var clouterId = Get.arguments;

  Clouter clouter = Clouter();

  // 여러 개의 SNS 정보를 저장하는 리스트
  List<SNSChannel> snsChannels = [
    SNSChannel(
        snsType: 'YouTube',
        channelName: 'MochaMilk',
        followers: 1650000,
        link: ''),
    SNSChannel(
        snsType: 'Instagram',
        channelName: 'MochaMilk_Insta',
        followers: 750000,
        link: ''),
    // 다른 SNS 정보 추가
  ];

  String formattedFee = '';

  @override
  void initState() {
    super.initState();

    // 희망 광고비 형식화
    if (clouter.fee >= 10000) {
      if (clouter.fee % 10000 == 0) {
        if (clouter.fee % 100000000 == 0) {
          formattedFee = (clouter.fee ~/ 100000000).toString() + '억';
        } else {
          formattedFee = (clouter.fee ~/ 10000).toString() + '만';
        }
      } else {
        if (clouter.fee % 100000000 == 0) {
          formattedFee = (clouter.fee / 100000000).toStringAsFixed(1) + '억';
        } else {
          formattedFee = (clouter.fee / 10000).toStringAsFixed(2) + '만';
        }
      }
    }
  }

  doChat(destination) {
    // 채팅방 이동
    Get.to(() => ChattingList());
  }

  bool isItemLiked = false;

  void handleItemTap() {
    setState(() {
      isItemLiked = !isItemLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.colors['white'],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 3,
            headerTitle: clouter.nickname, // 채널명 또는 계정명
          )),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: BouncingListview(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 3),
                        Text(clouter.starRating.toString(),
                            style: TextStyle(fontWeight: FontWeight.w800)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Like'),
                        LikeButton(isLiked: isItemLiked, onTap: handleItemTap),
                      ],
                    )
                  ],
                ),
                // 사진 캐러셀
                ImageCarousel(
                    imageSliders: imageSliders,
                    aspectRatio: 1.2,
                    enlarge: true),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('희망 광고비', style: TextStyle(fontSize: 15)),
                            Text('희망 카테고리', style: TextStyle(fontSize: 15)),
                            Text('계약한 광고 수', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(formattedFee,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: style.colors['logo'])),
                                Text(' points'),
                              ],
                            ),
                            Text(clouter.selectedCategories.join(', '),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: style.colors['logo'])),
                            Row(
                              children: [
                                Text(clouter.contractCount.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: style.colors['logo'])),
                                Text(' 건', style: TextStyle(fontSize: 15)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft, // 왼쪽으로 정렬
                    child: Text(
                      'SNS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                // 여러개 SNS 정보 반복해서 생성
                Column(
                  children: snsChannels.map((snsChannel) {
                    return SnsItemBox(
                      snsType: snsChannel.snsType,
                      username: snsChannel.channelName,
                      followers: snsChannel.followers,
                      snsUrl: snsChannel.link,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
        child: BigButton(
          title: '채팅하기',
          destination: "chattinglist",
          notJustRoute: true,
          function: doChat,
        ),
      ),
    );
  }
}
