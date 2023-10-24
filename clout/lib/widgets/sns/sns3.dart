import 'package:flutter/material.dart';
import '../../style.dart' as style;

class Sns3 extends StatelessWidget {
  const Sns3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: CustomBoxWithImage('assets/images/Instagram.png'),
              ),
              VerticalDivider(
                color: style.colors['category'],
                thickness: 3,
                width: 20,
              ),
              Expanded(
                child: CustomBoxWithImage('assets/images/TikTok.png'),
              ),
              VerticalDivider(
                color: style.colors['category'],
                thickness: 3,
                width: 20,
              ),
              Expanded(
                child: CustomBoxWithImage('assets/images/YouTube.png', customWidth: 90, customHeight: 90),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBoxWithImage extends StatelessWidget {
  final String imagePath;
  final double customWidth;
  final double customHeight;

  CustomBoxWithImage(this.imagePath, {this.customWidth = 70, this.customHeight = 70});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: Image.asset(
          imagePath,
          width: customWidth,
          height: customHeight,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
