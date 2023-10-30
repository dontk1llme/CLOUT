import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// screens
import 'package:clout/screens/review_register/review_register.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemImageSize = screenWidth * 0.24;
    final textSpacing = screenWidth * 0.03;
    final buttonWidth = screenWidth * 0.52;
    final fontSize1 = screenWidth * 0.05;
    final fontSize2 = screenWidth * 0.043;
    final fontSize3 = screenWidth * 0.04;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03), // 3% of screen width
      margin: EdgeInsets.fromLTRB(screenWidth * 0.05, screenWidth * 0.0125,
          screenWidth * 0.05, screenWidth * 0.0125),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // 10% of screen width
      ),
      child: SizedBox(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // 5% of screen width
              child: Image.asset(
                'assets/images/itemImage.jpg',
                width: itemImageSize,
                height: itemImageSize,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: textSpacing,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('업체명',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize1,
                    )),
                Text('계약서가 도착했어요!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize2,
                    )),
                Text('계약내용을 확인해보세요',
                    style: TextStyle(
                      color: style.colors['gray'],
                      fontSize: fontSize3,
                    )),
                SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => ReviewRegister());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF6B4EFF),
                      ), // 원하는 색상으로 변경
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              screenWidth * 0.1), // 10% of screen width
                        ),
                      ),
                    ),
                    child: Text('계약서 확인하기'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
