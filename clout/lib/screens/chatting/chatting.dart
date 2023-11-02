import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clout/style.dart' as style;
import 'package:flutter/scheduler.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:async';
import 'dart:convert';

import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/chatting/widgets/right_chat.dart';
import 'package:clout/screens/chatting/widgets/left_chat.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingState();
}

class _ChattingState extends State<ChattingPage> {
  final TextEditingController _controller = TextEditingController();

  late final WebSocketChannel _channel;
  final chatList = <String>[];
  final scrollController = ScrollController();
  final textController = TextEditingController();

  // 메시지 보낸 시간
  DateTime now = DateTime.now();
  String messageTime = DateFormat('HH:mm').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _channel = WebSocketChannel.connect(
      // Uri.parse('wss://echo.websocket.events'), // url
      Uri.parse('ws://3.35.132.84:8080/clout-websocket'), // url
    );
  }

  @override
  Widget build(BuildContext context) {
    // 채팅방에 대화 내용이 많이 쌓여있을 경우, 채팅방 입장시
    // 스크롤 최하단으로 이동시키기 위함
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    });
    return Scaffold(
        backgroundColor:
            style.colors['white'], // 기본 backgroundColor 밝은 회색이길래 넣은 코드
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Header(
              header: 1,
              headerTitle: '모카우유',
            )),
        body: GestureDetector(
          // 키보드 외 다른 영역 탭했을 때 키보드 숨기기
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            children: [
              // Text('2023-10-25', style: TextStyle(color: style.colors['gray'])),
              StreamBuilder(
                stream: _channel.stream, // StreamBuilder가 감시할 스트림
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    chatList.insert(0, snapshot.data);
                  }
                  if (scrollController.hasClients) {
                    scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.linear,
                    );
                  }
                  return Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return RightChat(chatList[index], messageTime);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemCount: chatList.length,
                    ),
                  );
                },
              ),
              SizedBox(height: 85),
            ],
          ),
        ),
        bottomSheet: Container(
            color: style.colors['white'], // 흰색 배경 설정
            child: Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    hintText: "메시지를 입력하세요..",
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        size: 25,
                        color: style.colors['main1'],
                      ),
                      onPressed: _sendMessage,
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
                  // 엔터 키를 눌렀을 때 호출될 함수
                  onFieldSubmitted: (_) {
                    _sendMessage();
                  },
                ))));
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
      // messages.add(_controller.text); // 새 메시지를 리스트에 추가하기
      _controller.clear(); // 입력 필드 지우기
      print(DateTime.now().millisecondsSinceEpoch);
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
