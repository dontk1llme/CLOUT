import 'package:clout/providers/user_controllers/advertiser_controller.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// api
import 'package:clout/hooks/item_api.dart';
import 'dart:convert';
import 'package:clout/type.dart';

// widgets
import 'package:clout/screens/mypage/widgets/info_item_box.dart';
import 'package:clout/screens/mypage/widgets/update_button.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';

class AdvertiserProfile extends StatefulWidget {
  AdvertiserProfile({super.key});

  @override
  State<AdvertiserProfile> createState() => _AdvertiserProfileState();
}

class _AdvertiserProfileState extends State<AdvertiserProfile> {
  AdvertiserInfo? advertiserInfo;
  var advertiser;

  final userController = Get.find<UserController>();
  final advertiserController = Get.put(AdvertiserController());

  @override
  void initState() {
    super.initState();
    _showDetail();
  }

  _showDetail() async {
    final ItemApi itemApi = ItemApi();

    // try {
    var response = await itemApi.getRequest(
        // '/member-service/v1/advertisers/', '${userController.userId}');
        '/v1/advertisers/',
        userController.userId);
    print(response);

    final decodedResponse = jsonDecode(response);

    setState(() {
      advertiser = Advertiser.fromJson(decodedResponse);
    });

    // } catch (e) {
    // print('advertiser profile error : $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 4,
          headerTitle: '내 프로필',
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: BouncingListview(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('회원 정보',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      // 회원 정보 수정 버튼 위젯 삽입
                      UpdateButton(),
                    ],
                  ),
                ),
                Divider(
                    thickness: 1, height: 1, color: style.colors['lightgray']),
                Column(
                  children: [
                    InfoItemBox(
                        titleName: '사업자명',
                        contentInfo: advertiser?.companyInfo.companyName ?? ''),
                    InfoItemBox(
                        titleName: '사업자등록번호',
                        contentInfo: advertiser?.companyInfo.regNum ?? ''),
                    InfoItemBox(
                        titleName: '소재지 주소',
                        contentInfo:
                            '(${advertiser?.address!.zipCode!}) ${advertiser?.address!.mainAddress!} ${advertiser?.address!.detailAddress!}'),
                    InfoItemBox(
                        titleName: '대표자명',
                        contentInfo: advertiser?.companyInfo.ceoName ?? ''),
                    InfoItemBox(
                        titleName: '담당자명',
                        contentInfo: advertiser?.companyInfo.managerName ?? ''),
                    InfoItemBox(
                        titleName: '담당자 연락처',
                        contentInfo:
                            advertiser?.companyInfo.managerPhoneNumber ?? ''),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
