// global
import 'dart:ui';
import 'package:clout/providers/campaign_register_controller.dart';
import 'package:clout/screens/campaign_register/widgets/age_slider.dart';
import 'package:clout/screens/campaign_register/widgets/category_dropdown.dart';
import 'package:clout/screens/campaign_register/widgets/itemdetail_textinput.dart';
import 'package:clout/screens/campaign_register/widgets/minimumfollowers_dialog.dart';
import 'package:clout/screens/campaign_register/widgets/offeringitem_textinput.dart';
import 'package:clout/screens/campaign_register/widgets/pay_dialog.dart';
import 'package:clout/screens/campaign_register/widgets/product_textinput.dart';
import 'package:clout/screens/campaign_register/widgets/recruit_input.dart';
import 'package:clout/screens/campaign_register/widgets/region_multiselect.dart';
import 'package:clout/screens/campaign_register/widgets/utils.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/widgets/signature.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/buttons/toggle_button.dart';
import 'package:clout/widgets/image_pickder/image_widget.dart';
import 'package:clout/widgets/sns/platform_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

// Screens
import 'package:clout/screens/campaign_register/widgets/data_title.dart';

// Widgets
import 'package:clout/widgets/header/header.dart';

class CampaignRegister extends ConsumerStatefulWidget {
  const CampaignRegister({super.key});

  @override
  CampaignRegisterState createState() => CampaignRegisterState();
}

class CampaignRegisterState extends ConsumerState<CampaignRegister> {
  final campaignRegisterController = Get.put(
    CampaignRegisterController(),
    tag: 'campaignRegister',
  );

  register() async {
    // if (category != null &&
    //     productName != null &&
    //     pay != null &&
    //     offeringItems != null &&
    //     itemDetail != null) {
    //   //등록하는 api 요청 들어가야 함
    // } else {
    await handleSaveButtonPressed(); // 서명 갤러리 저장함수
    await campaignRegisterController.printAll();
    // 1. 여기서 axios 통신 해서 db에 내용 저장하고
    //   -> 이 라인에 써야함
    // 2. ref.invalidate해서 provider 초기화 시켜주고
    //    - 2번은 big_button에서 실행하는걸로 함 안먹혀서
    // 3. 아래 함수로 home으로 빠져나가야 함
    Get.offNamed('/home');
    // }
  }

  bool positive = false;

  setPositive(input) {
    setState(() {
      positive = input;
    });
  }

  // 특정 요소에 접근할때 키로 접근하는듯
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  final GlobalKey stackGlobalKey = GlobalKey();

  Future<void> handleSaveButtonPressed() async {
    print("START CAPTURE");
    final renderObject = stackGlobalKey.currentContext!.findRenderObject();
    if (renderObject is RenderRepaintBoundary) {
      var boundary = renderObject;
      ui.Image image = await boundary.toImage(pixelRatio: 5.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        // 나중에 axios로 db에 넣을때 여기 if 안에서 넣어야 함
        campaignRegisterController.setSignature(byteData);
        await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
        Utils.toast('서명이 갤러리에 저장되었습니다.');
      }
    } else {
      print('여기로 왔는데?');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CampaignRegisterController>(
      tag: 'campaignRegister',
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Header(header: 4, headerTitle: '캠페인 작성')),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          child: BouncingListview(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataTitle(text: '카테고리'),
                  SizedBox(height: 10),
                  CategoryDropdown(
                      category: controller.category,
                      setCategory: controller.setCategory),
                  SizedBox(height: 20),
                  DataTitle(text: '제품명'),
                  SizedBox(height: 10),
                  ProductTextinput(setProductName: controller.setProductName),
                  SizedBox(height: 20),
                  DataTitle(text: '모집 인원(최대 100명)'),
                  RecruitInput(
                      recruitCount: controller.recruitCount,
                      setRecruitCount: controller.setRecruitCount),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DataTitle(text: '제공 내역'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '광고비 ',
                            style: TextStyle(height: 1.3),
                          ),
                          ToggleButton(
                            parentPositive: positive,
                            setPositive: setPositive,
                            leftIcon: Icons.money_off_outlined,
                            rightIcon: Icons.attach_money_outlined,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  positive
                      ? PayDialog(
                          title: '희망 광고비',
                          hintText: '희망 광고비 입력',
                          controllerTag: 'campaignRegister',
                        )
                      : Container(),
                  SizedBox(height: 10),
                  OfferingitemTextinput(
                    setOfferingItems: controller.setOfferingItems,
                  ),
                  SizedBox(height: 20),
                  DataTitle(text: '제품 배송 여부'),
                  SizedBox(height: 10),
                  ItemdetailTextinput(
                    setItemDetail: controller.setItemDetail,
                  ),
                  SizedBox(height: 20),
                  DataTitle(text: '제품 사진 첨부(최대 4장)'),
                  SizedBox(height: 10),
                  ImageWidget(controllerTag: 'campaignRegister'),
                  SizedBox(height: 20),
                  DataTitle(text: '광고 희망 플랫폼'),
                  SizedBox(height: 10),
                  PlatformToggle(
                    multiAllowed: true,
                    controllerTag: 'campaignRegister',
                  ),
                  SizedBox(height: 20),
                  DataTitle(text: '희망 클라우터 나이'),
                  AgeSlider(controllerTag: 'campaignRegister'),
                  SizedBox(height: 20),
                  DataTitle(text: '희망 최소 팔로워 수'),
                  MinimumfollowersDialog(
                    controllerTag: 'campaignRegister',
                  ),
                  SizedBox(height: 10),
                  DataTitle(text: '지역 선택'),
                  SizedBox(height: 10),
                  RegionMultiSelect(
                    controllerTag: 'campaignRegister',
                  ),
                  SizedBox(height: 20),
                  Signature(
                      globalKey: stackGlobalKey,
                      signatureKey: signatureGlobalKey),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: BigButton(
                        title: '캠페인 등록',
                        function: register,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
