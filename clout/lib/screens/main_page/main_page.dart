// global
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// providers
import 'package:clout/providers/nav_bar_controller.dart';

// screens
import 'package:clout/screens/home/home.dart';

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/nav_bar/nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Header(
          header: 0,
        ),
      ),
      body: GetBuilder<NavBarController>(builder: (controller) {
        if (controller.tab == 0) {
          return Home();
          // 아래 controll.tab에 따라 보여주는 화면 다르게 하기
        } else {
          return Home();
        }
      }),
      bottomNavigationBar: NavBar(),
    );
  }
}
