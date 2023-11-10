import 'package:clout/hooks/apis/authorized_api.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// api
import 'package:clout/type.dart';
import 'dart:convert';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';

// widgets
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/mypage/widgets/mypage_list.dart';
import 'package:clout/screens/point/widgets/my_wallet.dart';
import 'package:clout/widgets/common/main_drawer.dart';
import 'package:clout/widgets/common/nametag.dart';

// screens
import 'package:clout/screens/mypage/clouter/clouter_likedcampaign.dart';
import 'package:clout/screens/mypage/clouter/clouter_mycampaign.dart';
import 'package:clout/screens/point/clouter_point_list.dart';

class ClouterMyPage extends StatefulWidget {
  ClouterMyPage({super.key});

  @override
  State<ClouterMyPage> createState() => _ClouterMyPageState();
}

class _ClouterMyPageState extends State<ClouterMyPage> {
  var clouterInfo;

  final userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    _showDetail();
  }

  _showDetail() async {
    final AuthorizedApi authorizedApi = AuthorizedApi();

    var response = await authorizedApi.getRequest(
        '/member-service/v1/clouters/', userController.memberId);

    final decodedResponse = jsonDecode(response['body']);

    setState(() {
      clouterInfo = ClouterInfo.fromJson(decodedResponse);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 1,
          headerTitle: '마이페이지',
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: BouncingListview(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/clouterImage.jpg',
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NameTag(title: '클라우터'),
                            Text(clouterInfo?.nickName ?? '',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      child: Icon(Icons.arrow_forward_ios),
                      onTap: () => Get.toNamed('/clouterprofile',
                          arguments: userController.memberId),
                    ),
                  ],
                ),
                MyWallet(userType: 'clouter'),
                MyPageList(
                    title: '내 계약서',
                    btnTitle: '더보기',
                    onButtonPressed: () => Get.toNamed('/contractlist')),
                Divider(
                    thickness: 1, height: 1, color: style.colors['lightgray']),
                MyPageList(
                    title: '신청한 캠페인',
                    btnTitle: '더보기',
                    onButtonPressed: () => Get.to(ClouterMyCampaign())),
                Divider(
                    thickness: 1, height: 1, color: style.colors['lightgray']),
                MyPageList(
                    title: '관심있는 캠페인',
                    btnTitle: '더보기',
                    onButtonPressed: () => Get.to(ClouterLikedCampaign())),
                Divider(
                    thickness: 1, height: 1, color: style.colors['lightgray']),
                MyPageList(
                    title: '포인트 관리',
                    btnTitle: '더보기',
                    onButtonPressed: () => Get.to(ClouterPointList())),
                Divider(
                    thickness: 1, height: 1, color: style.colors['lightgray']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
