// global
import 'package:clout/screens/home/widgets/followercount_input_dialog.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/widgets/sns/sns3.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

// Screens
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/screens/home/widgets/number_picker_dialog.dart';

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
      offeringItems,
      itemDetail,
      minAge = 0,
      maxAge = 100,
      minimumFollowers,
      minimumFollowersString = '0',
      region;

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

  numbering(value, division) {
    return (value / division).floor();
  }

  converter(input) {
    if (input.length > 1) {
      int number = int.parse(input);
      var numbers = [
        numbering(number, 100000000),
        numbering(number % 100000000, 10000),
        numbering(number % 10000, 1000),
        numbering(number % 1000, 1)
      ];
      var result = '';
      var unit = ["억", '만', '천', ''];
      for (var i = 0; i < numbers.length; i++) {
        if (numbers[i] >= 1) {
          result += '${numbers[i]}${unit[i]} ';
        }
      }
      return result;
    } else {
      return input;
    }
  }

  setMinimumFollowersString(input) {
    setState(() {
      minimumFollowersString = input;
    });
  }

  setRegion(input) {
    setState(() {
      region = input;
    });
  }

  var categories = [
    '패션/뷰티',
    '건강/생활',
    '여행/레저',
    '육아',
    '전자제품',
    '음식',
    '방문/체험',
    '반려동물',
    '게임',
    '경제/비즈니스',
    '기타'
  ];

  var regions = [
    '전체',
    '서울',
    '부산',
    '대구',
    '인천',
    '광주',
    '대전',
    '울산',
    '세종',
    '경기',
    '강원',
    '충북',
    '충남',
    '전북',
    '전남',
    '경북',
    '경남',
    '제주',
  ];

  register() {
    if (category != null &&
        productName != null &&
        startDate != null &&
        endDate != null &&
        pay != null &&
        offeringItems != null &&
        itemDetail != null &&
        // age != null &&
        minimumFollowers != null &&
        region != null) {
      //등록하는 api 요청 들어가야 함
    }
    Get.toNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Header(header: 4, headerTitle: '캠페인 작성')),
        body: SizedBox(
            width: double.infinity,
            child: ListView(children: [
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataTitle(text: '카테고리'),
                      InputElement(
                        elementType: 'dropdown',
                        data: categories,
                        value: category,
                        placeholder: '--카테고리 선택--',
                        setData: setCategory,
                      ),
                      SizedBox(height: 10),
                      DataTitle(text: '제품명'),
                      SizedBox(
                          height: 55,
                          child: InputElement(
                            elementType: 'text',
                            placeholder: '제품명',
                            setData: setProductName,
                            maxLength: 50,
                          )),
                      SizedBox(height: 10),
                      DataTitle(text: '모집 인원(최대 100명)'),
                      SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () => showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: ((context) {
                                        return NumberPickerDialog(
                                          value: recruitCount,
                                          minValue: 1,
                                          maxValue: 100,
                                          setData: setRecruitCount,
                                        );
                                      })),
                                  child: Text(
                                    recruitCount.toString(),
                                    style: style.textTheme.titleMedium
                                        ?.copyWith(
                                            color: style.colors['main1'],
                                            fontWeight: FontWeight.bold,
                                            height: 1.1),
                                  )),
                              DataTitle(
                                text: '명',
                              )
                            ],
                          )),
                      SizedBox(height: 10),
                      DataTitle(text: '게시 기간'),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          DataTitle(text: '제공 내역'),
                        ],
                      ),
                      SizedBox(
                        height: 75,
                        child: InputElement(
                          elementType: 'text',
                          placeholder: '제공내역(제공할 물품 또는 서비스)',
                          setData: setOfferingItems,
                          maxLength: 300,
                        ),
                      ),
                      SizedBox(height: 10),
                      DataTitle(text: '제품 배송 여부'),
                      InputElement(
                        elementType: 'text',
                        placeholder: '제품 또는 서비스 상세 내용',
                        setData: setItemDetail,
                        maxLength: 500,
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(height: 10),
                      DataTitle(text: '제품 사진 첨부'),
                      DataTitle(text: '광고 희망 플랫폼'),
                      Sns3(),
                      DataTitle(text: '희망 클라우터 나이'),
                      SfRangeSliderTheme(
                          data: SfRangeSliderThemeData(
                            tooltipBackgroundColor: style.colors['main2'],
                            thumbColor: style.colors['white'],
                            thumbStrokeWidth: 1,
                            thumbStrokeColor: Colors.black,
                            activeTrackColor: style.colors['main1'],
                            inactiveTrackColor: style.colors['category'],
                            activeLabelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            inactiveLabelStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
                          ),
                          child: SfRangeSlider(
                            enableTooltip: true,
                            min: 0.0,
                            max: 100.0,
                            values: ageRanges,
                            showTicks: true,
                            showLabels: true,
                            // minorTicksPerInterval: 1,
                            stepSize: 1,
                            interval: 20,
                            numberFormat: NumberFormat("###세"),
                            onChanged: (SfRangeValues values) {
                              setAge(values);
                            },
                          )),
                      SizedBox(height: 10),
                      DataTitle(text: '희망 최소 팔로워 수'),
                      SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () => showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: ((context) {
                                        return FollowercountInputDialog(
                                          value: minimumFollowers,
                                          setData: setMinimumFollowers,
                                          setValueString:
                                              setMinimumFollowersString,
                                          valueString: minimumFollowersString,
                                          converter: converter,
                                        );
                                      })),
                                  child: Text(
                                    minimumFollowersString,
                                    style: style.textTheme.titleMedium
                                        ?.copyWith(
                                            color: style.colors['main1'],
                                            fontWeight: FontWeight.bold,
                                            height: 1.1),
                                  )),
                              DataTitle(
                                text: '명',
                              )
                            ],
                          )),
                      DataTitle(text: '지역 선택'),
                      InputElement(
                        elementType: 'dropdown',
                        setData: setRegion,
                        data: regions,
                        value: region,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: BigButton(
                          title: '게시글 등록',
                          function: register,
                        ),
                      )
                    ]),
              ),
            ])));
  }
}
