// global
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// providers
import 'package:clout/providers/nav_bar_controller.dart';

// screens
import 'package:clout/screens/campaign_register/campaign_register.dart';
import 'package:clout/screens/home/home.dart';
import 'package:clout/screens/campaign_list/campaign_list.dart';
import 'package:clout/screens/clouter_list/clouter_list.dart';

// widgets
import 'package:clout/widgets/nav_bar/nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return Scaffold(
      body: GetBuilder<NavBarController>(builder: (controller) {
        if (controller.tab == 0) {
          return Home();
          // 아래 controll.tab에 따라 보여주는 화면 다르게 하기
        } else if (controller.tab == 1) {
          return CampaignList();
        } else if (controller.tab == 2) {
          return CampagignRegister();
        }
        return Home();
      }),
      bottomNavigationBar: NavBar(),
    );
  }
}
