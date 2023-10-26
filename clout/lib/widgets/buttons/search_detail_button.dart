import 'package:clout/widgets/input/input.dart';
import 'package:clout/widgets/input/input_elements/widgets/dropdown_input.dart';
import 'package:clout/widgets/sns/sns3.dart';
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
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 600,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('상세 조건 설정'),
                          Icon(Icons.close),
                        ]),
                    Text('광고 희망 플랫폼'),
                    Sns3(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('다중 선택 가능'),
                    ),
                    Text('희망 클라우터 나이'),
                    // slider 추가
                  ],
                ),
              ),
            );
          },
        );
      },
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
