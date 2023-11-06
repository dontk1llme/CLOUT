import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:clout/screens/join/widgets/VerifyAlert.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/widgets/input/input.dart';


class NumberVerify extends StatefulWidget {
  const  NumberVerify({super.key});

  @override
  State<NumberVerify> createState() => _NumberVerifyState();
}

class _NumberVerifyState extends State<NumberVerify>{
  // 백엔드에서 사용자와 프론트로 랜덤코드 전송해 줌
  // 여기에서 받아서 사용자에게 보이지 않게 가지고 있음
  // 사용자가 입력한 값이 백엔드에서 받은 값과 일치하면 인증 성공 
  // 성공하면 저 머냐 ... 버튼 인증->완료 로 바꾸는 로직도 짜야 함
  // 임시로 한번 짜보겠음.

  var number;

  String backNum = '1119';

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
                      if (number==backNum){
                        // 인증 성공
                        Get.back();
                      }
                      else{
                        print('응안돼');
                        VerifyAlert.show(context, '인증에 실패했습니다');
                      }
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
