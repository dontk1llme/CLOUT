import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/chatting/widgets/right_chat.dart';
import 'package:clout/screens/chatting/widgets/left_chat.dart';

class Chatting extends StatefulWidget {
  const Chatting({super.key});

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            style.colors['white'], // 기본 backgroundColor 밝은 회색이길래 넣은 코드
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Header(
              header: 1,
              headerTitle: '모카우유',
            )),
        body: Column(
          children: [
            Text('2023-10-25', style: TextStyle(color: style.colors['gray'])),
            RightChat("모카우유님, 안녕하세요~"),
            LeftChat("안녕하세요!"),
            RightChat("프로필 보고 연락드렸습니다 ~ 혹시 애견 장난감 협찬 관심 있으신가요?"),
            LeftChat("혹시 어떤 장난감인지 사이트나 사진으로 미리 볼 수 있을까요~?")
          ],
        ),
        bottomSheet: Container(
            color: style.colors['white'], // 흰색 배경 설정
            child: Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    hintText: "메시지를 입력하세요..",
                    suffixIcon: Icon(
                      Icons.send,
                      size: 25,
                      color: style.colors['main1'],
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Color(0xFF979C9E))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFF927EFF)),
                    ),
                  ),
                ))));
  }
}
