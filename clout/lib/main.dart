import 'package:flutter/material.dart';
import 'widgets/nav_bar/nav_bar.dart';
import 'widgets/header/header.dart';
import 'style.dart' as style;

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'NotoSansKR',
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var header = 0;
  var headerTitle = '채널명/메뉴명';

  setTab(tabIndex) {
    setState(() {
      tab = tabIndex;
    });
  }

  setHeader(headerType) {
    setState(() {
      header = headerType;
      print('header : ${header}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Header(
              header: header,
              headerTitle: headerTitle,
              // 헤더 원하는거 번호를 header 변수에 넣고 headerTitle엔 메뉴명이나 채널명이 있을경우 넣어주면 나옴
            )),
        bottomNavigationBar:
            NavBar(tab: tab, setTab: setTab, setHeader: setHeader));
  }
}
