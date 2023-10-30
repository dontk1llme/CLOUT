import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/screens/join/widgets/small_button.dart';
import 'package:clout/screens/join/numberVerify.dart';
import 'package:clout/widgets/input/input.dart';

class ClouterUpdate1 extends StatefulWidget {
  ClouterUpdate1({Key? key}) : super(key: key);

  @override
  _ClouterUpdate1State createState() => _ClouterUpdate1State();
}

class _ClouterUpdate1State extends State<ClouterUpdate1> {
  double percent = 0.33;

  var name;
  var gender;
  var birthday;
  var phoneNumber;
  var email;
  var password;
  var checkPassword;
  var address;

  // 추가 변수와 함수
  var obscured = true; // 예시 값
  Icon suffixIcon = Icon(Icons.visibility); // 예시 값
  var doubleId = 1;

  setDoubleId() {
    setState((){
      //없을 때 0
      //중복이면 1
      //가능하면 2 
      //지금은 편의상 중복 아니라고 함
      doubleId = 2;
      print(doubleId);
    });
  }

  setName(input) {
    setState(() {
      name = input;
    });
  }

  setGender(input) {
    setState(() {
      gender = input;
    });
  }

  setBirthday(input) {
    setState(() {
      birthday = input;
    });
  }

  setPhoneNumber(input) {
    setState(() {
      phoneNumber = input;
    });
  }

  setEmail(input) {
    setState(() {
      email = input;
    });
  }

  setPassword(input) {
    setState(() {
      password = input;
    });
  }

  setCheckPassword(input) {
    setState(() {
      checkPassword = input;
    });
  }

  setAddress(input){
    setState((){
      address=input();
    });
  }

  setObscured() {
    setState(() {
      obscured = !obscured;
      print(obscured);
      if (obscured) {
        suffixIcon = Icon(Icons.visibility_outlined);
      } else {
        suffixIcon = Icon(Icons.visibility_off_outlined);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          percent: percent,
          lineHeight: 10,
          backgroundColor: style.colors['category'],
          progressColor: style.colors['logo'],
          barRadius: Radius.circular(5),
        ),
        SizedBox(height: 5), // 20픽셀의 공백
        Text(
            '1. 기본 정보',
            style: style.textTheme.titleSmall, // 텍스트 스타일 설정
            textAlign: TextAlign.left, // 얘 왜 말 안 들음? 왼쪽 가라니까
          ),
          SizedBox(height: 10),
          Input(
            placeholder: '이름',
            setText: setName,
            enabled: false,
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Input(
                placeholder: '전화번호 변경',
                setText: setPhoneNumber,
              ),
              Positioned(
                right: 10,
                top: 10,
                child: SmallButton(
                  title: '인증',
                  function: () {
                    Get.to(() => NumberVerify());
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Input(
            placeholder: '패스워드 변경',
            setText: setPassword,
            obscure: obscured,
            suffixIcon: suffixIcon,
            setObscured: setObscured,
          ),
          SizedBox(height: 10),
          Input(
            placeholder: '패스워드 변경',
            setText: setCheckPassword,
            obscure: obscured,
            suffixIcon: suffixIcon,
          ),
          SizedBox(height: 10),
          Input(
            placeholder: '주소 변경',
            setText: setAddress,
          ),
          SizedBox(height: 20),

        
      ],
    );
  }
}
