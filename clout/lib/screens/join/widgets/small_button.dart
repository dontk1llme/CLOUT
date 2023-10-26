import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;
class SmallButton extends StatelessWidget {
  SmallButton(
      {super.key,
      this.title,
      this.destination,
      this.function,
      this.notJustRoute,
      this.textColor,
      this.buttonColor}) {
    textColor ??= style.colors['white'];
    buttonColor ??= style.colors['main1'];
  }

  final title;
  final destination;
  final function;
  // 단순 페이지 이동이 아니라 조건(로그인, 검색 조건 설정같은 것이 붙을 경우)
  final notJustRoute;
  Color? textColor;
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
        width: 55,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            function();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            title,
            style: style.textTheme.bodySmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
