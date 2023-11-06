import 'package:clout/screens/point/clouter_point_list.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/screens/mypage/clouter_mycampaign.dart';
import 'package:clout/screens/mypage/clouter_likedcampaign.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/buttons/small_outlined_button.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/screens/mypage/widgets/mypage_list.dart';
import 'package:clout/screens/point/widgets/my_wallet.dart';
import 'package:clout/widgets/common/main_drawer.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';

class ClouterMyPage extends StatelessWidget {
  const ClouterMyPage({super.key});

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
                            Text('모카우유님',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      child: Icon(Icons.arrow_forward_ios),
                      onTap: () => Get.toNamed('/clouterdetail'),
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
