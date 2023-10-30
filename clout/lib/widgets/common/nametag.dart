import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class NameTag extends StatelessWidget {
  const NameTag({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final categoryNameWidth = screenWidth * 0.175;
    final categoryNameHeight = screenWidth * 0.05; 

    return Padding(
      padding: EdgeInsets.only(top: 5, right: 4),
      child: SizedBox(
        width: categoryNameWidth,
        height: categoryNameHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: style.colors['category'],
            borderRadius:
                BorderRadius.circular(screenWidth * 0.01),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: style.colors['white'],
                fontWeight: FontWeight.w700,
                fontSize: categoryNameHeight * 0.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
