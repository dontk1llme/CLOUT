import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class Sns4 extends StatelessWidget {
  const Sns4({super.key, required this.platform, required this.followerScale});

  final String? followerScale;
  final String? platform;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: style.colors['main3'],
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      child: Row(
        children: [
          Image.asset('assets/images/${platform}.png', width: 20, height: 20),
          Text(
            ' $followerScale명',
            style: TextStyle(fontSize: 12, color: style.colors['darkgray']),
          ),
        ],
      ),
    );
  }
}
