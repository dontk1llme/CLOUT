import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// widgets
import 'package:clout/widgets/buttons/small_button.dart';
import 'package:clout/screens/point/withdraw/widgets/bold_text.dart';
import 'package:clout/screens/point/withdraw/widgets/medium_text.dart';
import 'package:clout/widgets/buttons/big_button.dart';

class MyWallet extends StatefulWidget {
  final String userType; // clouter 인지 advertiser 인지

  const MyWallet({super.key, required this.userType});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  var f = NumberFormat('###,###,###,###');

  Future<String> fetchUserPoints() async {
    // 💥 여기에서 API 호출 사용자 포인트 가져오기

    // 일단 테스트용 421800 반환
    // await Future.delayed(Duration(seconds: 1)); // 가짜로 지연 추가
    final formattedPoints = f.format(421800);
    return formattedPoints;
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
              destination: '/addfirst',
              // function: _showModal,
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
    return FutureBuilder<String>(
      future: fetchUserPoints(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('에러 발생: ${snapshot.error}');
        } else {
          final userPoints = snapshot.data ?? '0';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    Text(userPoints,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
                    SizedBox(width: 10),
                    Text('points',
                        style: TextStyle(
                          fontSize: 17,
                        )),
                  ],
                ),
                buttons,
              ],
            ),
          );
        }
      },
    );
  }
}
