import 'package:clout/providers/image_picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

class BigButton extends ConsumerStatefulWidget {
  BigButton({
    super.key,
    required this.title,
    this.destination,
    this.function,
    this.notJustRoute,
    this.textColor,
    this.buttonColor,
  }) {
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
  BigButtonState createState() => BigButtonState();
}

class BigButtonState extends ConsumerState<BigButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        ref.invalidate(imagePickerProvider),
        if (widget.destination != null)
          {
            // destination이 null이 아닌 경우에만 실행
            if (widget.notJustRoute != null && widget.notJustRoute)
              {widget.function(widget.destination)}
            else
              {Get.offAllNamed(widget.destination)}
          }
        else
          {widget.function()}
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        widget.title,
        style: style.textTheme.headlineLarge?.copyWith(
          color: widget.textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
