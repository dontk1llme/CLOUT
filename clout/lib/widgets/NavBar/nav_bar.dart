import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key, this.tab, this.setTab});

  final tab;

  final setTab;

  @override
  Widget build(BuildContext context) {
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
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
              color: Colors.black, size: 25), // 이거 나중에 테마 칼라로 바꿔야 함
          unselectedIconTheme: IconThemeData(color: Colors.grey, size: 25), //
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: '홈'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined), label: '목록'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: '찜'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: '마이페이지'),
          ],
          currentIndex: tab,
          onTap: (value) {
            print(value);
            setTab(value);
          },
        ));
  }
}
