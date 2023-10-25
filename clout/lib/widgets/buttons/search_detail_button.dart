import 'package:flutter/material.dart';
import '../../style.dart' as style;

// TextButton에서 Icon이 Text 우측으로 가게 하기 위해서 추가함
class TextButtonWithSubfixIconChild extends StatelessWidget {
  TextButtonWithSubfixIconChild({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final Widget label;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xFF6B4EFF),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(child: label),
            SizedBox(width: 4),
            icon,
          ],
        ),
      ),
    );
  }
}

class SearchDetailButton extends StatelessWidget {
  const SearchDetailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // 가장 오른쪽으로 정렬
      children: <Widget>[
        TextButtonWithSubfixIconChild(
          label: Text(
            '검색 조건 설정',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          icon: Icon(Icons.chevron_right, size: 20),
          onPressed: () {
            // 버튼이 눌렸을 때 수행할 동작을 정의
          },
        ),
      ],
    );
  }
}
