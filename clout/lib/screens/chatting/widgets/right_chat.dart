import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class RightChat extends StatelessWidget {
  final String message;

  RightChat(this.message);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // 말풍선과 Text를 아래로 정렬
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end, // 말풍선을 오른쪽으로 이동
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              constraints: BoxConstraints(maxWidth: 250), // 최대 width 설정
              decoration: BoxDecoration(
                color: style.colors['logo'],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: style.colors['white'],
                  fontSize: 19,
                ),
                softWrap: true, // 줄바꿈 활성화
                maxLines: null,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Text(
            '11:17',
            style: TextStyle(
              fontSize: 13,
              color: style.colors['gray'],
            ),
          ),
        ),
      ],
    );
  }
}
