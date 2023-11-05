import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

class GuestNavBar extends StatelessWidget {
  const GuestNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      // height: 100,
      // decoration: BoxDecoration(color: style.colors['category']),
      // child: FractionallySizedBox(
      //   widthFactor: 0.9,
      child: Column(
        children: [
          SizedBox(height: 10),
          Text('CLOUT가 맘에 드셨다면?'),
          SizedBox(height: 10),
          SizedBox(
            width: 100,
            child: BigButton(
                function: () => Get.offNamed('/regitser'),
                title: 'CLOUT 가입하러 가기'),
          ),
          SizedBox(height: 10),
        ],
      ),
      // ),S
    );
  }
}
