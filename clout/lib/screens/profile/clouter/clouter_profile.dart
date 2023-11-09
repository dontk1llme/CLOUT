import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/screens/mypage/widgets/selected_category.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/screens/mypage/widgets/info_item_box.dart';
import 'package:clout/screens/mypage/widgets/update_button.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';

// api
import 'package:clout/hooks/item_api.dart';
import 'dart:convert';
import 'package:clout/type.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';

class ClouterProfile extends StatefulWidget {
  const ClouterProfile({super.key});

  @override
  State<ClouterProfile> createState() => _ClouterProfileState();
}

class _ClouterProfileState extends State<ClouterProfile> {
  var clouterInfo;

  final userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    _showDetail();
  }

  _showDetail() async {
    final ItemApi itemApi = ItemApi();

    var response = await itemApi.getRequest(
        '/member-service/v1/clouters/', userController.userId);
    // await itemApi.getRequest('/v1/clouters/', userController.userId);
    // '/member-service/v1/clouters/', userController.userId);

    final decodedResponse = jsonDecode(response);

    setState(() {
      clouterInfo = ClouterInfo.fromJson(decodedResponse);
    });
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
                            UpdateButton(),
                          ],
                        ),
                      ),
                      Divider(
                          thickness: 1,
                          height: 1,
                          color: style.colors['lightgray']),
                      Column(
                        children: [
                          InfoItemBox(
                              titleName: '닉네임',
                              contentInfo: clouterInfo?.nickName ?? ''),
                          InfoItemBox(
                              titleName: '이름',
                              contentInfo: clouterInfo?.name ?? ''),
                          InfoItemBox(
                              titleName: '연락처',
                              contentInfo: clouterInfo?.phoneNumber ?? ''),
                          InfoItemBox(
                              titleName: '생년월일',
                              contentInfo: clouterInfo?.birthday ?? ''),
                          InfoItemBox(
                              titleName: '나이',
                              contentInfo: clouterInfo?.age.toString() ?? ''),
                          InfoItemBox(
                              titleName: '주소',
                              contentInfo:
                                  '(${clouterInfo?.address!.zipCode!}) ${clouterInfo?.address!.mainAddress!} ${clouterInfo?.address!.detailAddress!}'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          DataTitle(text: '광고 희망 플랫폼'),
                          SizedBox(height: 10),
                          // PlatformToggle(multiAllowed: true, ),
                          SizedBox(height: 20),
                          DataTitle(text: '희망 광고비'),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('${clouterInfo?.hopeCost!.minCost!}원 ~ ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: style.colors['main1'],
                                  )),
                              SizedBox(width: 10),
                              Text('points',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(height: 20),
                          DataTitle(text: '희망 카테고리'),
                          Row(
                            children: [
                              for (var category
                                  in clouterInfo?.categoryList ?? [])
                                SelectedCategory(title: category),
                            ],
                          ),
                          SizedBox(height: 20),
                          DataTitle(text: '희망 지역'),
                          Row(
                            children: [
                              for (var region in clouterInfo?.regionList ?? [])
                                SelectedCategory(title: region),
                            ],
                          ),

                          SizedBox(height: 20),
                          DataTitle(text: '내 사진'),
                          // 등록한 사진 목록...
                        ],
                      )
                    ],
                  )),
            )));
  }
}

  // 💥 선택한 지역, 카테고리, 사진, 협상여부, 팔로워 수 추가하기