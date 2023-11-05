// global
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/screens/join/find_password.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/input/input.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'widgets/title_text.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email;

  var password;

  var obscured = true;

  var suffixIcon = Icon(Icons.visibility_outlined);

  setEmail(input) {
    setState(() {
      email = input;
      print(email);
      print(password);
    });
  }

  setPassword(input) {
    setState(() {
      password = input;
      print(password);
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

  doLogin() {
    // 유저가 맞는지 확인하는 api 통신 여기에 두고 맞으면 main으로 이동하게

    final userController = Get.find<UserController>();

    // 유저가 클라우터일 경우
    // userController.setClouter();
    // 유저가 광고주일 경우
    userController.setAdvertiser();

    Get.offAllNamed('/home');
    // Fluttertoast.showToast(msg: '아이디 혹은 비밀번호를 확인해주세요');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 상단 글자 Column
          Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(text: '로그인해서'),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Clout_Logo.png',
                            width: 100,
                          ),
                          TitleText(
                            text: ' 와 함께',
                          )
                        ],
                      ),
                      TitleText(text: '매칭해요')
                    ]),
              )),
          // 중간 Input Column
          Flexible(
              flex: 4,
              child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Input(
                        placeholder: '이메일 입력',
                        setText: setEmail,
                      ),
                      SizedBox(height: 15),
                      Input(
                        placeholder: '패스워드 입력',
                        setText: setPassword,
                        obscure: obscured,
                        suffixIcon: suffixIcon,
                        setObscured: setObscured,
                      ),
                      SizedBox(
                        // width: double.infinity,
                        height: 25,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              Get.to(FindPassword());
                            },
                            child: Text('패스워드가 기억이 안나요',
                                style: style.textTheme.bodyMedium?.copyWith(
                                    color: style.colors['gray'], height: 2))),
                      ),
                      // 로그인 버튼
                      // destination 수정해서 로그인 실행하는 로직 넣어야 함
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: BigButton(
                            title: '로그인',
                            function: doLogin,
                          ),
                        ),
                      ),
                    ],
                  ))),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('계정이 아직 없다면?',
                    style: style.textTheme.bodyLarge
                        ?.copyWith(color: style.colors['gray'])),
                TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () => {Get.toNamed('/join')},
                    child: Text(' 회원가입하기',
                        style: style.textTheme.bodyLarge?.copyWith(
                            color: style.colors['main1'],
                            fontWeight: FontWeight.w700)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
