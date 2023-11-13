import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/common/choicechip.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:clout/hooks/apis/points_transactions.dart';
import 'package:clout/type.dart';
import 'dart:convert';

// widgets
import 'package:clout/screens/point/widgets/my_wallet.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/point/widgets/point_item_box.dart';

class AdvertiserPointList extends StatefulWidget {
  const AdvertiserPointList({super.key});

  @override
  State<AdvertiserPointList> createState() => _AdvertiserPointListState();
}

class _AdvertiserPointListState extends State<AdvertiserPointList> {

  @override
  void initState() {
    super.initState();
    // initState에서 비동기 작업 수행
    getPointList();
  }


  final userController = Get.find<UserController>();

  Future<void> getPointList() async {

    var authorization = userController.userLogin['authorization'];
    var requestBody = {
      "memberId": userController.memberId,
      "category": 'ALL', //actionchoice에 따라 바뀌어야 함
      "page": '0', //temp
      "size": '10', //temp
    };

    var response = await PointsTransactionsApi.getRequest(
      '/point-service/v1/points/transactions',
      authorization,
      requestBody,
    );


    print('$requestBody');
    print('응답: $response');
    var responseData = json.decode(response);
    var content = responseData['content'];
    print("응답2: $content");
    

    // List<PointItem> pointItems = (json.decode(response.bodyBytes)['content'] as List)
    //     .map((data) => PointItem.fromJson(data))
    //     .toList();
    
    // print('포인트 아이템');
    // print(pointItems);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.colors['white'],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 4,
          headerTitle: '포인트 관리', // 채널명 또는 계정명
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: BouncingListview(
          child: FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 0.9,
            child: Column(
              children: [
                MyWallet(
                  userType: "advertiser",
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('포인트 내역',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 19)),
                ),
                ActionChoiceExample(
                    labels: ['전체 내역', '사용 내역', '충전 내역'], chipCount: 3),
                Divider(
                  color: style.colors['lightgray'],
                  thickness: 1,
                ),
                PointItemBox(type: '출금', time: '시간', title: '이름', point: '32132',),
                // PointItemBox(type: '충전'),
                // PointItemBox(type: '사용'),
                // PointItemBox(type: '사용'),
                // PointItemBox(type: '출금'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
