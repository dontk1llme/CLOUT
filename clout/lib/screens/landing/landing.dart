import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/widgets/buttons/big_button/big_button.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(
            flex: 5,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              '광고주와 인플루언서',
                              style: style.textTheme.titleSmall
                                  ?.copyWith(color: style.colors['darkgray']),
                            )),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              '매칭부터 계약서 작성까지',
                              style: style.textTheme.titleSmall
                                  ?.copyWith(color: style.colors['darkgray']),
                            )),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/Clout_Logo.png',
                                height: 40,
                                alignment: Alignment.centerLeft,
                              )),
                        )
                      ])),
              Image.asset('assets/images/landingPage.jpeg')
            ])),
        Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  BigButton(
                    title: '로그인',
                    destination: '/login',
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/join'); 
                    },
                    onHover:(isHovered) {
                      //색깔 바뀌게 추가해야 함
                    },
                    child: Text('회원가입',
                        style: style.textTheme.headlineSmall?.copyWith(
                            color: style.colors['main1'],
                            fontWeight: FontWeight.w600)))
                ]),
              ),
            ))
      ]),
    );
  }
}
