import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/common/nametag.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/buttons/small_outlined_button.dart';
import 'package:clout/screens/point/widgets/my_wallet.dart';

// screens
import 'package:clout/screens/mypage/advertiser_detail.dart';
import 'package:clout/screens/mypage/widgets/mypage_list.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';

class AdvertiserMyPage extends StatelessWidget {
  const AdvertiserMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SmallOutlinedButton(
                          title: '프로필 보기',
                          onPressed: () => Get.toNamed('/clouterdetail'),
                        ),
                      ],
                    ),
                    MyWallet(userType: 'advertiser'),
                    MyPageList(title: '내 계약서', btnTitle: '더보기'),
                    Divider(
                        thickness: 1,
                        height: 1,
                        color: style.colors['lightgray']),
                    MyPageList(title: '내 캠페인', btnTitle: '더보기'),
                    BouncingListview(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Row(children: [
                          for (num i = 0; i < 10; i++)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                              child: CampaignItemBox(),
                            )
                        ]),
                      ),
                    ),
                    Divider(
                        thickness: 1,
                        height: 1,
                        color: style.colors['lightgray']),
                    MyPageList(title: '관심있는 클라우터', btnTitle: '더보기'),
                    BouncingListview(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Row(children: [
                          for (num i = 0; i < 10; i++)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                              child: ClouterItemBox(),
                            )
                        ]),
                      ),
                    ),
                    Divider(
                        thickness: 1,
                        height: 1,
                        color: style.colors['lightgray']),
                  ]))),
        ));
  }
}
