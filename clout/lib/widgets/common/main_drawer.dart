import 'package:clout/screens/join/widgets/clouter/category_toggle.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

class MyDrawer extends StatefulWidget {
  @override
  MyDrawerState createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
            child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
              color: style.colors['main3'],
              border: Border(
                  bottom:
                      BorderSide(color: style.colors['main2']!, width: 0.1))),
          child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NameTag(title: '클라우터'),
                    SizedBox(height: 3),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('김보연님',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                        Icon(
                          Icons.chevron_right,
                        ),
                      ],
                    )
                  ])),
        ),
        ListTile(
          // leading: Icon(Icons.home),
          title: Text('홈', style: style.textTheme.headlineSmall),
          onTap: () {
            Get.toNamed('/home');
            Scaffold.of(context).closeDrawer();
          },
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          // leading: Icon(Icons.home),
          title: Text('내 계약서', style: style.textTheme.headlineSmall),
          onTap: () {
            Get.toNamed('/home');
            Scaffold.of(context).closeDrawer();
          },
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: Text('캠페인 목록', style: style.textTheme.headlineSmall),
          onTap: () {
            Scaffold.of(context).closeDrawer();
          },
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: Text('클라우터 목록', style: style.textTheme.headlineSmall),
          onTap: () {
            Scaffold.of(context).closeDrawer();
          },
          trailing: Icon(Icons.chevron_right),
        ),
        ExpansionTile(
          iconColor: style.colors['main1'],
          textColor: style.colors['main1'],
          tilePadding: EdgeInsets.only(right: 15),
          title: ListTile(
            title: Text('포인트 관리', style: style.textTheme.headlineSmall),
          ),
          children: [
            ListTile(
              tileColor: style.colors['main3'],
              selectedColor: style.colors['main1'], // 이건지
              splashColor: style.colors['main1'], // 이건지
              title: Text('포인트 출금', style: style.textTheme.bodyLarge),
              onTap: () {
                Get.toNamed('/withdrawfirst');
                Scaffold.of(context).closeDrawer();
              },
            ),
            ListTile(
              tileColor: style.colors['main3'],
              title: Text('포인트 내역', style: style.textTheme.bodyLarge),
              onTap: () {
                Get.toNamed('/clouterpointlist');
                Scaffold.of(context).closeDrawer();
              },
            ),
          ],
        ),
        ExpansionTile(
          iconColor: style.colors['main1'],
          textColor: style.colors['main1'],
          tilePadding: EdgeInsets.only(right: 15),
          title: ListTile(
            title: Text('마이페이지', style: style.textTheme.headlineSmall),
          ),
          children: [
            ListTile(
              title: Text('신청한 캠페인', style: style.textTheme.bodyLarge),
              onTap: () {
                Get.toNamed('/cloutercampaign');
                Scaffold.of(context).closeDrawer();
              },
            ),
            ListTile(
              title: Text('관심있는 캠페인', style: style.textTheme.bodyLarge),
              onTap: () {
                Get.toNamed('/clouterlikedcampaign');
                Scaffold.of(context).closeDrawer();
              },
            ),
          ],
        ),
        // Divider(
        //   color: style.colors['main2'],
        //   thickness: 0.1,
        // ),
        ListTile(
          title: Text('이용약관'),
          onTap: () {
            Scaffold.of(context).closeDrawer();
          },
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: Text('개인정보처리방침'),
          onTap: () {
            Scaffold.of(context).closeDrawer();
          },
          trailing: Icon(Icons.chevron_right),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: style.colors['main3'],
            border: Border.all(
              color: style.colors['main2']!,
              width: 0.1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, color: style.colors['category']),
                      Text('  로그아웃')
                    ]),
              ),
              Container(color: style.colors['main2'], height: 25, width: 0.3),
              Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings_outlined,
                          color: style.colors['category']),
                      Text('  설정')
                    ]),
              ),
            ],
          ),
        )
      ],
    )));
  }
}
