// global
import 'package:clout/providers/user_controller.dart';
import 'package:clout/screens/clouter/clouter_list.dart';
import 'package:clout/screens/mypage/advertiser_mypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// providers
import 'package:clout/providers/nav_bar_controller.dart';

// screens
import 'package:clout/screens/home/home.dart';
import 'package:clout/screens/campaign_list/campaign_list.dart';
import 'package:clout/screens/chatting/chatting_list.dart';
import 'package:clout/screens/mypage/clouter_mypage.dart';

// widgets
import 'package:clout/widgets/nav_bar/nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    Get.put(NavBarController(), permanent: true);
    return Scaffold(
      body: GetBuilder<NavBarController>(builder: (controller) {
        if (controller.tab == 0) {
          return Home();
          // 아래 controll.tab에 따라 보여주는 화면 다르게 하기
        } else if (controller.tab == 1) {
          return userController.clouter ? CampaignList() : ClouterList();
          // return userController.clouter ? CampaignList() : Container();
        } else if (userController.clouter && controller.tab == 2) {
          return ChattingList();
        } else if (controller.tab == 3) {
          return userController.clouter ? ClouterMyPage() : ChattingList();
        } else if (controller.tab == 4 && !userController.clouter) {
          return AdvertiserMyPage();
        }
        return Home();
      }),
      bottomNavigationBar: NavBar(),
    );
  }
}
