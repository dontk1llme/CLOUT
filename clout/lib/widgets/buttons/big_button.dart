import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;
class BigButton extends StatelessWidget {
  BigButton(
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
  final notJustRoute;
  Color? textColor;
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () => {
            if (notJustRoute != null && notJustRoute) {function(destination)}
            else {Get.toNamed(destination)}
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
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
        ),
      ),
    );
  }
}
