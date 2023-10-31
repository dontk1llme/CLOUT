import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/screens/join/widgets/small_button.dart';

// widgets
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/input/input.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/join/numberVerify.dart';

class AdvertiserUpdate extends StatefulWidget {
  const AdvertiserUpdate({super.key});

    @override
  State<AdvertiserUpdate> createState() => _AdvertiserUpdateState();
}

class _AdvertiserUpdateState extends State<AdvertiserUpdate> {

   var name;
  var phoneNumber;
  var email;
  var password;
  var checkPassword;
  var buisnessName;
  var buisnessNumber;
  var buisnessAddress;

  var obscured = true; 
  Icon suffixIcon = Icon(Icons.visibility); 
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

  setBuisnessName(input){
    setState((){
      buisnessName=input;
    });
  }

  setBuisnessNumber(input){
    setState((){
      buisnessNumber=input;
    });
  }

  setBuisnessAddress(input){
    setState((){
      buisnessAddress=input();
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
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '회원 정보 수정',
          ),
        ),
        body: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: BouncingListview(
              child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Column(
                    children: [
                      Divider(
                          thickness: 1,
                          height: 1,
                          color: style.colors['lightgray']),
                      Input(
                  placeholder: '담당자명 입력',
                  setText: setName,
                ),
                SizedBox(height: 10),
                Stack(
                  children: [
                    Input(
                      placeholder: '전화번호 입력',
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
                  placeholder: '아이디',
                  setText: setEmail,
                  enabled: false,
                ),
                SizedBox(height: 10),
                Input(
                  placeholder: '패스워드 입력',
                  setText: setPassword,
                  obscure: obscured,
                  suffixIcon: suffixIcon,
                  setObscured: setObscured,
                ),
                SizedBox(height: 10),
                Input(
                  placeholder: '패스워드 확인',
                  setText: setCheckPassword,
                  obscure: obscured,
                  suffixIcon: suffixIcon,
                ),
                SizedBox(height: 10),
                Input(
                  placeholder: '업체명 입력',
                  setText: setBuisnessName,
                ),
                SizedBox(height: 10),
                Input(
                  placeholder: '사업자등록번호 입력',
                  setText: setBuisnessNumber,
                ),
                SizedBox(height: 10),
                Input(
                  placeholder: '업체 주소 입력',
                  setText: setBuisnessAddress,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: BigButton(
                    title: '수정 완료',
                    function: () {
                      // 업데이트 로직 추가할 것
                      Get.toNamed('/advertiserdetail');
                    },
                  ),
                )
                    ],
                  )),
            )));
  }
}
