// global
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/screens/home/widgets/number_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// Widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/input/input_elements/input_element.dart';
import 'package:numberpicker/numberpicker.dart';

class CampagignRegister extends StatefulWidget {
  CampagignRegister({super.key});

  @override
  State<CampagignRegister> createState() => _CampagignRegisterState();
}

class _CampagignRegisterState extends State<CampagignRegister> {
  var category,
      productName,
      startDate,
      endDate,
      recruitCount = 1,
      pay,
      offeringItems,
      itemDetail,
      age,
      minimumFollowers,
      region;

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
      age = input;
    });
  }

  setMinimumFollowers(input) {
    setState(() {
      minimumFollowers = input;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(header: 4, headerTitle: '캠페인 작성')),
      body: ListView(children: [
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
            height: 80,
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
                      style: style.textTheme.titleMedium?.copyWith(
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
        DataTitle(text: '희망 클라우터 정보'),
      ]),
    );
  }
}
