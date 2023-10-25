import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

// Widgets
import 'widgets/nav_bar/nav_bar.dart';
import 'widgets/header/header.dart';

// Screens
import 'screens/landing/landing.dart';
import 'package:clout/screens/login/login.dart';
import 'package:clout/screens/main_page/main_page.dart';
import 'package:clout/screens/notification/notification.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      fontFamily: 'NotoSansKR',
    ),
    getPages: [
      GetPage(name: '/', page: () => Landing()),
      GetPage(name: '/login', page: () => Login()),
      GetPage(name: '/home', page: () => MainPage()),
      GetPage(name: '/notification', page: () => NotificationPage()),
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
