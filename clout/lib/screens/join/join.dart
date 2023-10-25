//widgets
import 'package:clout/widgets/buttons/big_button.dart';

//global
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class Join extends StatelessWidget {
  const Join({super.key});

  // doClouterJoin(destination) {
  //   //인플루언서 가입
  //   // Get.toNamed('/');
  // }

  // doAdvertiserJoin(destination){
  //   // Get.toNamed('/')
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: style.colors['white'], 
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: BigButton(
                    title: '인플루언서로 시작하기',
                    // function: doClouterJoin, 
                  ),
                ),

                
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: style.colors['main2'], 
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: BigButton(
                    title: '광고주로 시작하기',
                    textColor: style.colors['main1'],
                    buttonColor: style.colors['white'],
                    // function: doAdvertiserJoin, 
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
