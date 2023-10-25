import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/widgets/input/input.dart';


class NumberVerify extends StatefulWidget {
  const  NumberVerify({super.key});

  @override
  State<NumberVerify> createState() => _NumberVerifyState();
}

class _NumberVerifyState extends State<NumberVerify>{
  var number;

  setNumber(input) {
    setState(() {
      number = input;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25, top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('문자로 발송된', style: style.textTheme.titleMedium),
            Row(
              children: <Widget>[
                Text('인증번호', style: style.textTheme.titleMedium?.copyWith(
                  color: style.colors['main1'])),
                Text('를', style: style.textTheme.titleMedium),
              ],
            ),
            Text('입력해 주세요', style: style.textTheme.titleMedium),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 25, bottom: 20),
              child: Column(
                children: [
                  //네모네모로 예쁘게 그려두었지만... 하나씩 입력받는 아이디어를 모르겠어서
                  Input(
                    placeholder: '인증번호 입력',
                    setText: setNumber,
                  ),
                  SizedBox(height: 40), 
                  BigButton(
                    title: '인증하기',
                    function: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
