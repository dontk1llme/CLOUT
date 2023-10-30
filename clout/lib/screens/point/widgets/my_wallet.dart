import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/buttons/small_button.dart';

// screens
import 'package:clout/screens/point/withdraw/withdraw_first.dart';

class MyWallet extends StatelessWidget {
  final String userType; // clouter 인지 advertiser 인지

  const MyWallet({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    Widget buttons;
    if (userType == 'advertiser') {
      buttons = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: SmallButton(
              title: '충전하기',
              destination: 'withdraw',
              function: () {},
            ),
          ),
          SizedBox(width: 5),
          Flexible(
            flex: 1,
            child: SmallButton(
              title: '출금하기',
              destination: 'withdrawfirst',
              function: () {},
            ),
          ),
        ],
      );
    } else if (userType == 'clouter') {
      buttons = Flexible(
        flex: 1,
        child: SmallButton(
          title: '출금하기',
          destination: 'withdraw',
          function: () {},
        ),
      );
    } else {
      buttons = Text('로그인 후 이용가능합니다');
    }
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      width: double.infinity,
      height: 185,
      decoration: BoxDecoration(
        color: style.colors['white'],
        borderRadius: BorderRadius.circular(10),
        boxShadow: style.shadows['shadow'],
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet_outlined),
            SizedBox(width: 10),
            Text('내 지갑',
                style: TextStyle(
                  fontSize: 20,
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('421,800',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),
            SizedBox(width: 10),
            Text('points',
                style: TextStyle(
                  fontSize: 17,
                ))
          ],
        ),
        buttons,
      ]),
    );
  }
}
