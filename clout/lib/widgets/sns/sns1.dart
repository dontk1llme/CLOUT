import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/sns/widgets/bold_text.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SnsItemBox(
          username: 'MochaMilk',
          followers: '165만',
          imageName: 'assets/images/youtube.png',
          snsUrl: 'https://www.youtube.com/c/mochamilk',
        ),
        SnsItemBox(
          username: 'milk_the_samoyed',
          followers: '13만 4천',
          imageName: 'assets/images/instagram.png',
          snsUrl: 'https://www.instagram.com/milk_the_samoyed/',
        ),
        SnsItemBox(
          username: 'mochamilk',
          followers: '15만',
          imageName: 'assets/images/tiktok.png',
          snsUrl: 'https://www.instagram.com/milk_the_samoyed/',
        ),
      ],
    ));
  }
}
