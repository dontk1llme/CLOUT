// Global
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

// Widgets

//
import 'widgets/sns/sns3.dart';
import 'style.dart' as style;

// Screens
import 'package:clout/screens/clouter/clouter_list.dart';
import 'screens/landing/landing.dart';
import 'package:clout/screens/login/login.dart';
import 'package:clout/screens/join/join.dart';
import 'package:clout/screens/main_page/main_page.dart';
import 'package:clout/screens/notification/notification.dart';
import 'package:clout/screens/point/point_list.dart';
import 'package:clout/screens/review_register/review_complete.dart';

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
      GetPage(name: '/notification', page: () => NotificationPage()),
      GetPage(name: '/pointlist', page: () => PointList()),
      GetPage(name: '/reviewcomplete', page: () => ReviewComplete()),
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
