import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/sns/widgets/sns_item_box.dart';

class Sns1 extends StatefulWidget {
  const Sns1({Key? key}) : super(key: key);

  @override
  _Sns1State createState() => _Sns1State();
}

class _Sns1State extends State<Sns1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SnsItemBox(
          username: 'MochaMilk',
          followers: '165만',
          imageName: 'assets/images/YouTube.png',
          snsUrl: 'https://www.youtube.com/c/mochamilk',
        ),
        SizedBox(width: 5),
        SnsItemBox(
          username: 'milk_the_samoyed',
          followers: '13만 4천',
          imageName: 'assets/images/Instagram.png',
          snsUrl: 'https://www.instagram.com/milk_the_samoyed/',
        ),
        SizedBox(width: 5),
        SnsItemBox(
          username: 'mochamilk',
          followers: '15만',
          imageName: 'assets/images/TikTok.png',
          snsUrl: 'https://www.instagram.com/milk_the_samoyed/',
        ),
      ],
    ));
  }
}
