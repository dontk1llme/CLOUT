// Global
import 'package:clout/screens/campaign_register/campaign_register.dart';
import 'package:clout/utilities/my_scroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Screens
import 'screens/landing/landing.dart';
import 'package:clout/screens/login/login.dart';
import 'package:clout/screens/join/join.dart';
import 'package:clout/screens/main_page/main_page.dart';
import 'package:clout/screens/notification/notification.dart';
import 'package:clout/screens/review_register/review_complete.dart';
import 'package:clout/screens/chatting/chatting_list.dart';
import 'package:clout/screens/point/clouter_point_list.dart';
import 'package:clout/screens/mypage/clouter_mypage.dart';
import 'package:clout/screens/mypage/advertiser_mypage.dart';
import 'package:clout/screens/mypage/advertiser_detail.dart';
import 'package:clout/screens/mypage/clouter_detail.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      fontFamily: 'NotoSansKR',
    ),
    getPages: [
      GetPage(name: '/', page: () => Landing()),
      GetPage(name: '/login', page: () => Login()),
      GetPage(name: '/join', page: () => Join()),
      GetPage(name: '/home', page: () => MainPage()),
      GetPage(name: '/campaignRegister', page: () => CampaignRegister()),
      GetPage(name: '/notification', page: () => NotificationPage()),
      GetPage(name: '/reviewcomplete', page: () => ReviewComplete()),
      GetPage(name: '/chattinglist', page: () => ChattingList()),
      GetPage(name: '/clouterpointlist', page: () => ClouterPointList()),
      GetPage(name: '/cloutermypage', page: () => ClouterMyPage()),
      GetPage(name: '/advertisermypage', page: () => AdvertiserMyPage()),
      GetPage(name: '/advertiserdetail', page: () => AdvertiserDetail()),
      GetPage(name: '/clouterdetail', page: () => ClouterDetail()),
    ],
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('asdfasdf'));
  }
}
