import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// screens
import 'package:clout/screens/review_register/review_register.dart';
import 'package:clout/screens/clouter/clouter_select.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5), // 5% of screen width
              child: Image.asset(
                'assets/images/itemImage.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('업체명',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    )),
                Text('계약서가 도착했어요!',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )),
                Text('계약내용을 확인해보세요',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: style.colors['gray'],
                      fontSize: 15,
                    )),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => ClouterSelect());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF6B4EFF),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.1),
                        ),
                      ),
                    ),
                    child: Text('계약서 확인하기'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
