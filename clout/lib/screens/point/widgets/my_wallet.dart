import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/buttons/small_button.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
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
        SmallButton(
          title: '출금하기',
          destination: 'withdraw',
          function: () {},
          notJustRoute: '',
        )
        // ElevatedButton(onPressed: () {}, child: Text('출금하기')),
      ]),
    );
  }
}
