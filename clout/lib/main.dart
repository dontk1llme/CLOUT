// Global
import 'package:clout/screens/clouter_list/clouter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

// Widgets

// Screens
import 'screens/landing/landing.dart';
import 'package:clout/screens/login/login.dart';
import 'package:clout/screens/main_page/main_page.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      fontFamily: 'NotoSansKR',
    ),
    getPages: [
      GetPage(name: '/', page: () => Landing()),
      GetPage(name: '/login', page: () => Login()),
      GetPage(name: '/home', page: () => MainPage()),
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
    return Scaffold();
  }
}
