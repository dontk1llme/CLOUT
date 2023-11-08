// global
import 'package:clout/hooks/login_api.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/screens/find_password/find_password.dart';
import 'package:clout/widgets/header/header.dart';
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
  var obscured = true;

  var suffixIcon = Icon(Icons.visibility_outlined);

  final userController = Get.find<UserController>();

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

  doLogin() async {
    // 유저가 맞는지 확인하는 api 통신 여기에 두고 맞으면 main으로 이동하게
    Get.offAllNamed('/home');
    // // 1. 보냄
    // userController.setUserInfo(); // 'userInfo' 설정
    // final LoginApi loginApi = LoginApi();
    // var loginData = await loginApi.postRequest(
    //     '/v1/members/login', userController.userInfo);

    // 1. 보냄
    userController.setUserInfo(); // 'userInfo' 설정
    final LoginApi loginApi = LoginApi();
    var loginData = await loginApi.postRequest(
        '/member-service/v1/members/login', userController.userInfo);

    // 2. 리턴값에서 유저/클라우터 가려받고 set
    if (loginData['login_success'] == true) {
      if (loginData['clout_or_adv'] == 'ADVERTISER') {
        //광고주 1
        userController.setAdvertiser();
      } else {
        //클라우터 -1
        userController.setClouter();
      }
      userController.setUserLogin(loginData);
      print(userController.userLogin);
      Get.offAllNamed('/home');
    } else {
      // 3. 만약 0 리턴되면 showtoast
      // 혹은 login_api에서 설정해야 할 수도
      Fluttertoast.showToast(msg: '아이디 혹은 비밀번호를 확인해주세요');
    }
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
                        placeholder: '아이디 입력',
                        setText: userController.setUserId,
                      ),
                      SizedBox(height: 15),
                      Input(
                        placeholder: '패스워드 입력',
                        setText: userController.setPassword,
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
