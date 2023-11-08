import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/common/main_drawer.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/buttons/small_outlined_button.dart';
import 'package:clout/screens/point/widgets/my_wallet.dart';

// screens
import 'package:clout/screens/point/advertiser_point_list.dart';
import 'package:clout/screens/mypage/advertiser/advertiser_mycampaign.dart';
import 'package:clout/screens/mypage/advertiser/advertiser_likedclouters.dart';
import 'package:clout/screens/contract_list/contract_list.dart';
import 'package:clout/screens/mypage/widgets/mypage_list.dart';

class AdvertiserMyPage extends StatelessWidget {
  const AdvertiserMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
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
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('업체명(담당자명)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SmallOutlinedButton(
                    title: '프로필 보기',
                    onPressed: () => Get.toNamed('/clouterdetail'),
                  ),
                ],
              ),
              MyWallet(userType: 'advertiser'),
              MyPageList(
                  title: '내 계약서',
                  btnTitle: '더보기',
                  onButtonPressed: () => Get.to(ContractList())), //
              Divider(
                  thickness: 1, height: 1, color: style.colors['lightgray']),
              MyPageList(
                  title: '내 캠페인',
                  btnTitle: '더보기',
                  onButtonPressed: () => Get.to(AdvertiserMycampaign())), //
              Divider(
                  thickness: 1, height: 1, color: style.colors['lightgray']),
              MyPageList(
                  title: '관심있는 클라우터',
                  btnTitle: '더보기',
                  onButtonPressed: () => Get.to(AdvertiserLikedclouters())),
              Divider(
                  thickness: 1, height: 1, color: style.colors['lightgray']),
              MyPageList(
                  title: '포인트 관리',
                  btnTitle: '더보기',
                  onButtonPressed: () => Get.to(AdvertiserPointList())),
              Divider(
                  thickness: 1, height: 1, color: style.colors['lightgray']),
            ]),
          ),
        ),
      ),
    );
  }
}
