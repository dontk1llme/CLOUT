// global
import 'package:clout/providers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../style.dart' as style;

// providers
import '../../providers/nav_bar_controller.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key, this.tab, this.setTab});

  final tab;

  final setTab;

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    final userController = Get.put(UserController());
    return Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            // 그림자효과
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
            ),
          ],
        ),
        child: GetBuilder<NavBarController>(
            builder: (controller) => BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedIconTheme:
                      IconThemeData(color: style.colors['main1'], size: 30),
                  unselectedIconTheme:
                      IconThemeData(color: style.colors['gray'], size: 27), //
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined), label: '홈'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.content_paste_search_outlined),
                        label: '목록'),
                    if (!userController.clouter)
                      BottomNavigationBarItem(
                          icon: Icon(Icons.add_box_outlined), label: '캠페인 등록'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.chat_bubble_outline), label: '채팅'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_2_outlined), label: '마이페이지'),
                  ],
                  onTap: (value) {
                    if (!userController.clouter && value == 2) {
                      Get.toNamed('campaignRegister');
                    } else {
                      controller.setTab(value);
                    }
                  },
                  currentIndex: controller.tab,
                )));
  }
}
