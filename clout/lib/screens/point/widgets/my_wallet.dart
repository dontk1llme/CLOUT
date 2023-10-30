import 'package:clout/screens/point/withdraw/widgets/bold_text.dart';
import 'package:clout/screens/point/withdraw/widgets/medium_text.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/buttons/small_button.dart';

class MyWallet extends StatefulWidget {
  final String userType; // clouter 인지 advertiser 인지

  const MyWallet({super.key, required this.userType});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  void _showModal() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.close,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Icon(
                Icons.warning,
                size: 30,
                color: Colors.amber,
              ),
              SizedBox(height: 15),
              MediumText(text: '포인트 충전 후'),
              MediumText(text: '보유한 포인트는'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MediumText(text: '현금으로'),
                  SizedBox(width: 5),
                  BoldText(text: '재환전이'),
                  SizedBox(width: 3),
                  Text('불가',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red)),
                  MediumText(text: '합니다.')
                ],
              ),
              SizedBox(height: 15),
              Text('포인트는 사용할 만큼만'),
              Text('충전하여 사용해주세요!'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: SizedBox(
                  height: 30,
                  width: 230,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: style.colors['category'],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                      children: [
                        Icon(Icons.check, color: style.colors['main1']),
                        SizedBox(width: 3),
                        Text('내용을 확인했습니다.'),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: BigButton(
                        title: '아니요',
                        textColor: Colors.black,
                        buttonColor: style.colors['lightgray'],
                        function: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      flex: 1,
                      child: BigButton(
                        title: '충전하기',
                      )),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buttons;
    if (widget.userType == 'advertiser') {
      buttons = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: SmallButton(
              title: '충전하기',
              // destination: 'chargemessage',
              function: _showModal,
            ),
          ),
          // SizedBox(width: 5),
          // Flexible(
          //   flex: 1,
          //   child: SmallButton(
          //     title: '출금하기',
          //     destination: 'withdrawfirst',
          //   ),
          // ),
        ],
      );
    } else if (widget.userType == 'clouter') {
      buttons = Flexible(
        flex: 1,
        child: SmallButton(
          title: '출금하기',
          destination: 'withdrawfirst',
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
