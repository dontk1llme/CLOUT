import 'package:clout/utilities/category_translator.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// api
import 'package:get/get.dart';
import 'dart:convert';
import 'package:clout/type.dart';
import 'package:clout/utilities/like_utils.dart';
import 'package:clout/hooks/apis/authorized_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

// utility
import 'package:clout/utilities/bouncing_listview.dart';

// widgets
import 'package:clout/widgets/sns/widgets/sns_item_box.dart';
import 'package:clout/widgets/image_carousel.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/widgets/buttons/like_button.dart';
import 'package:clout/screens/chatting/widgets/chatting_item_box.dart';

// screen
import 'package:clout/screens/chatting/chatting_list.dart';

// controller
import 'package:clout/providers/user_controllers/user_controller.dart';

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
  ClouterInfo? clouterInfo;
  var clouterId = Get.arguments;
  final userController = Get.find<UserController>();
  int? bookmarkId;

  @override
  void initState() {
    super.initState();
    _showDetail();
  }

  doChat(destination) {
    // 채팅방 이동
    Get.to(() => ChattingList());
  }

  bool isItemLiked = false;

  // 좋아요 상태 초기화 함수
  loadInitialLikeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? storedBookmarkId = prefs.getInt('bookmarkId');

    setState(() {
      // 현재 페이지의 clouterId와 저장된 bookmarkId가 일치하면 좋아요
      isItemLiked = storedBookmarkId != null && storedBookmarkId == clouterId;
    });
  }

  Future<void> updateLikeStatus(bool isLiked, int targetId) async {
    try {
      final AuthorizedApi api = AuthorizedApi();
      var requestBody = {
        "memberId": userController.memberId,
        "targetId": targetId,
      };

      if (isLiked) {
        // 좋아요 상태일 때 서버에 POST 요청
        var response = await api.postRequest(
            '/member-sevice/v1/bookmarks/clouter', requestBody);
        if (response != null && response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          setState(() {
            isItemLiked = true;
            bookmarkId = responseData['bookmarkId'];
          });
        }
      } else if (bookmarkId != null) {
        await api.deleteRequest(
            '/member-service/v1/bookmarks/delete', bookmarkId);
        setState(() {
          isItemLiked = false;
          bookmarkId = null;
        });
      }
    } catch (e) {
      print("에러~: $e");
    }
  }

  _showDetail() async {
    final AuthorizedApi api = AuthorizedApi();
    var response =
        await api.getRequest('/member-service/v1/clouters/', clouterId);
    // var statusCode = response['statusCode'];
    if (response != null) {
      final decodedResponse = jsonDecode(response['body']);
      setState(() {
        clouterInfo = ClouterInfo.fromJson(decodedResponse);
      });
    } else {
      print('clouter detail 에러 ❌.');
    }
  }

  final AdCategoryTranslator categoryTranslator = AdCategoryTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.colors['white'],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 3,
          headerTitle: clouterInfo?.nickName, // 채널명 또는 계정명
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 3),
                            Text(clouterInfo?.avgScore?.toString() ?? '0',
                                style: TextStyle(fontWeight: FontWeight.w800)),
                          ],
                        ),
                        if (userController.memberType == 1)
                          Row(
                            children: [
                              Text('Like'),
                              LikeButton(
                                isLiked: isItemLiked,
                                onTap: () {
                                  updateLikeStatus(
                                      !isItemLiked, clouterInfo!.clouterId!);
                                },
                              )
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
                                Text('계약한 광고 수',
                                    style: TextStyle(fontSize: 15)),
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
                                    Text(clouterInfo?.minCost.toString() ?? '',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: style.colors['logo'])),
                                    Text(' points'),
                                  ],
                                ),
                                Text(
                                    clouterInfo?.categoryList != null
                                        ? clouterInfo!.categoryList!
                                            .map((category) =>
                                                AdCategoryTranslator
                                                    .translateAdCategory(
                                                        category))
                                            .join(', ')
                                        : '',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: style.colors['logo'])),
                                Row(
                                  children: [
                                    // Text(clouterInfo.contractCount.toString(),
                                    //     style: TextStyle(
                                    //         fontSize: 15,
                                    //         fontWeight: FontWeight.w700,
                                    //         color: style.colors['logo'])),
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
                    clouterInfo?.channelList != null
                        ? Column(
                            children: clouterInfo!.channelList!
                                .map((e) => SnsItemBox(
                                    username: e.name,
                                    followers: e.followerScale,
                                    snsType: e.platform,
                                    snsUrl: e.link))
                                .toList(),
                          )
                        : Container(),
                    SizedBox(height: 70),
                  ],
                ),
              ),
            ),
            userController.memberType != 1
                ? Container()
                : Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      color: Colors.transparent,
                      child: SizedBox(
                        height: 50,
                        child: BigButton(
                          title: '채팅하기',
                          function: () => Get.to(Chatting()),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
