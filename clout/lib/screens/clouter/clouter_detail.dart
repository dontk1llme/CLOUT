import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/sns/sns3.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/widgets/buttons/like_button.dart';

// screen
import 'package:clout/screens/chatting/chatting_list.dart';

class ClouterDetail extends StatefulWidget {
  const ClouterDetail({super.key});

  @override
  State<ClouterDetail> createState() => _ClouterDetailState();
}

class _ClouterDetailState extends State<ClouterDetail> {
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
            headerTitle: '모카우유', // 채널명 또는 계정명
          )),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 3),
                    Text('20.5', style: TextStyle(fontWeight: FontWeight.w800)),
                  ],
                ),
                Row(
                  children: [
                    Text('찜할래요'),
                    LikeButton(isLiked: isItemLiked, onTap: handleItemTap),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(7),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.asset(
                  'assets/images/clouterImage.jpg',
                  width: double.infinity,
                  height: 300,
                ),
              ),
            ),
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
                    flex: 1, // 첫 번째 Column의 폭을 50%로 설정
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
                    flex: 1, // 두 번째 Column의 폭을 50%로 설정
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('50만원',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: style.colors['logo'])),
                        Text('반려동물',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: style.colors['logo'])),
                        Text('N건',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: style.colors['logo'])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
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
            Sns3(),
          ],
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
