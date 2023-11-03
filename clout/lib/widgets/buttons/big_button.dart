import 'package:clout/providers/image_picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

class BigButton extends StatelessWidget {
  BigButton({
    super.key,
    required this.title,
    required this.function,
    this.textColor,
    this.buttonColor,
  }) {
    textColor ??= style.colors['white'];
    buttonColor ??= style.colors['main1'];
  }

  final title;
  final function;
  // 단순 페이지 이동이 아니라 조건(로그인, 검색 조건 설정같은 것이 붙을 경우)
  Color? textColor;
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: style.textTheme.headlineLarge?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
