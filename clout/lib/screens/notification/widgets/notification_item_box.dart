import 'package:flutter/material.dart';
import '../../../style.dart' as style;

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/itemImage.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20, // 이미지와 텍스트 사이의 간격 설정
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('업체명',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                Text('계약서가 도착했어요!',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text('계약내용을 확인해보세요',
                    style: TextStyle(color: style.colors['gray'])),
                SizedBox(
                  width: 195,
                  child: ElevatedButton(
                    onPressed: () {
                      // 버튼이 눌렸을 때 수행
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF6B4EFF),
                      ), // 원하는 색상으로 변경
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
