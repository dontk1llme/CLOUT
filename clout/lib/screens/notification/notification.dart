import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/utilities/my_scroll.dart';
import 'package:flutter/material.dart';
import '../../style.dart' as style;

// widgets
import '../../widgets/header/header.dart';
import '../notification/widgets/notification_item_box.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Header(
              header: 4,
              headerTitle: '알림 목록',
            )),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffEBE7FF),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.only(top: 20),
            child: BouncingListview(
              child: Column(
                children: [
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                ],
              ),
            )));
  }
}
