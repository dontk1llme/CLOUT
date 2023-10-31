import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class Sns2 extends StatefulWidget {
  const Sns2({super.key});

  @override
  State<Sns2> createState() => _Sns2State();
}

class _Sns2State extends State<Sns2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: style.colors['white'],
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: style.colors['white'], borderRadius: BorderRadius.circular(5)),
      child: Row(children: [
        Image.asset('assets/images/YouTube.png', width: 20, height: 20),
        Image.asset('assets/images/Instagram.png', width: 20, height: 20),
        Image.asset('assets/images/TikTok.png', width: 20, height: 20),
      ]),
    );
  }
}
