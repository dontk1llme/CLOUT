// global
import 'dart:ui';

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
import 'package:clout/widgets/signature.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/buttons/toggle_button.dart';
import 'package:clout/widgets/image_picker.dart';
import 'package:clout/widgets/sns/sns3.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'dart:ui' as ui;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// Screens
import 'package:clout/screens/campaign_register/widgets/data_title.dart';

// Widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/input/input_elements/input_element.dart';

class CampaignRegister extends StatefulWidget {
  CampaignRegister({super.key});

  @override
  State<CampaignRegister> createState() => _CampaignRegisterState();
}

class _CampaignRegisterState extends State<CampaignRegister> {
  var category,
      productName,
      startDate,
      endDate,
      recruitCount = 1,
      pay,
      payString = '0',
      offeringItems,
      itemDetail,
      minAge = 0,
      maxAge = 100,
      minimumFollowers,
      minimumFollowersString = '0';

  List<String?> selectedRegions = [];

  setSelectedRegions(input) {
    setState(() {
      selectedRegions = input;
    });
  }

  SfRangeValues ageRanges = SfRangeValues(0, 100);

  setCategory(input) {
    setState(() {
      category = input;
    });
  }

  setProductName(input) {
    setState(() {
      productName = input;
    });
  }

  setStartDate(input) {
    setState(() {
      startDate = input;
    });
  }

  setEndDate(input) {
    setState(() {
      endDate = input;
    });
  }

  setRecruitCount(input) {
    setState(() {
      recruitCount = input;
    });
  }

  setPay(input) {
    setState(() {
      pay = input;
    });
  }

  setPayString(input) {
    setState(() {
      payString = input;
    });
  }

  setOfferingItems(input) {
    setState(() {
      offeringItems = input;
    });
  }

  setItemDetail(input) {
    setState(() {
      itemDetail = input;
    });
  }

  setAge(input) {
    setState(() {
      ageRanges = input;
      minAge = input.start.toInt();
      maxAge = input.end.toInt();
    });
  }

  setMinimumFollowers(input) {
    setState(() {
      minimumFollowers = input;
    });
  }

  setMinimumFollowersString(input) {
    setState(() {
      minimumFollowersString = input;
    });
  }

  register(destination) {
    if (category != null &&
        productName != null &&
        startDate != null &&
        endDate != null &&
        pay != null &&
        offeringItems != null &&
        itemDetail != null &&
        // age != null &&
        minimumFollowers != null) {
      //등록하는 api 요청 들어가야 함
    } else {
      handleSaveButtonPressed(); // 서명 갤러리 저장함수
      Get.offNamed(destination);
    }
  }

  bool positive = false;

  setPositive(input) {
    setState(() {
      positive = input;
    });
  }

  // 특정 요소에 접근할때 키로 접근하는듯
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  void handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    if (bytes != null) {
      // 나중에 axios로 db에 넣을때 여기 if 안에서 넣어야 함
      // 글고 만약 캠페인 등록
      await ImageGallerySaver.saveImage(bytes.buffer.asUint8List());
      Utils.toast('서명이 갤러리에 저장되었습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: Scaffold(
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
                            category: category, setCategory: setCategory),
                        SizedBox(height: 20),
                        DataTitle(text: '제품명'),
                        SizedBox(height: 10),
                        ProductTextinput(setProductName: setProductName),
                        SizedBox(height: 20),
                        DataTitle(text: '모집 인원(최대 100명)'),
                        RecruitInput(
                            recruitCount: recruitCount,
                            setRecruitCount: setRecruitCount),
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
                                      rightIcon: Icons.attach_money_outlined)
                                ]),
                          ],
                        ),
                        positive
                            ? PayDialog(
                                pay: pay,
                                payString: payString,
                                setPay: setPay,
                                setPayString: setPayString)
                            : Container(),
                        SizedBox(height: 10),
                        OfferingitemTextinput(
                            setOfferingItems: setOfferingItems),
                        SizedBox(height: 20),
                        DataTitle(text: '제품 배송 여부'),
                        SizedBox(height: 10),
                        ItemdetailTextinput(setItemDetail: setItemDetail),
                        SizedBox(height: 20),
                        DataTitle(text: '제품 사진 첨부(최대 4장)'),
                        SizedBox(height: 10),
                        ImageWidget(),
                        SizedBox(height: 10),
                        DataTitle(text: '광고 희망 플랫폼'),
                        SizedBox(height: 10),
                        Sns3(),
                        SizedBox(height: 20),
                        DataTitle(text: '희망 클라우터 나이'),
                        AgeSlider(ageRanges: ageRanges, setAge: setAge),
                        SizedBox(height: 20),
                        DataTitle(text: '희망 최소 팔로워 수'),
                        MinimumfollowersDialog(
                            minimumFollowers: minimumFollowers,
                            minimumFollowersString: minimumFollowersString,
                            setMinimumFollowers: setMinimumFollowers,
                            setMinimumFollowersString:
                                setMinimumFollowersString),
                        DataTitle(text: '지역 선택'),
                        SizedBox(height: 10),
                        RegionMultiSelect(
                            selectedRegions: selectedRegions,
                            setSelectedRegions: setSelectedRegions),
                        SizedBox(height: 20),
                        DataTitle(text: '전자 서명'),
                        SizedBox(height: 10),
                        Signature(globalKey: signatureGlobalKey),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: BigButton(
                            title: '캠페인 등록',
                            function: register,
                            destination: '/home',
                          ),
                        )
                      ]),
                )))));
  }
}
