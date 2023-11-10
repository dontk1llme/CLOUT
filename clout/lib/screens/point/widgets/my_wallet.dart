import 'package:clout/hooks/points_api.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

// widgets
import 'package:clout/widgets/buttons/small_button.dart';
import 'package:clout/screens/point/withdraw/widgets/bold_text.dart';
import 'package:clout/screens/point/withdraw/widgets/medium_text.dart';
import 'package:clout/widgets/buttons/big_button.dart';

//provider
import 'package:clout/providers/user_controllers/user_controller.dart';

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

    //사용자 ID
    final userController = Get.find<UserController>();
    var memberId = userController.memberId;
    var authorization = userController.userLogin['authorization'];
    print('사용자 ID: $memberId');
    print('사용자 토큰: $authorization');
    //api 요청
    final PointsAPI pointsAPI = PointsAPI();
    var response =
        await pointsAPI.getRequest('/point-service/v1/points', memberId, authorization);
    var json = jsonDecode(response);
    
    print('API 응답: $response');
    print('파싱된 JSON: $json');

    final formattedPoints = json['totalPoint'].toString();
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
