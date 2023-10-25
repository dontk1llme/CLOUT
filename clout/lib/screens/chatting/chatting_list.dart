import 'package:clout/screens/chatting/widgets/chatting_item_box.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/header/header.dart';

class ChattingList extends StatefulWidget {
  const ChattingList({super.key});

  @override
  State<ChattingList> createState() => _ChattingListState();
}

class _ChattingListState extends State<ChattingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.colors['white'],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 1,
            headerTitle: '채팅 목록', // 채널명 또는 계정명
          )),
      body: ListView(
        children: [
          ChattingItemBox(),
          ChattingItemBox(),
          ChattingItemBox(),
        ],
      ),
    );
  }
}
