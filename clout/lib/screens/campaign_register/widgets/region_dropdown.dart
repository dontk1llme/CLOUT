import 'package:clout/widgets/input/input_elements/input_element.dart';
import 'package:flutter/material.dart';

class RegionDropdown extends StatelessWidget {
  RegionDropdown({super.key, this.setRegion, this.region});
  final setRegion;
  final region;

  final regions = [
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

  @override
  Widget build(BuildContext context) {
    return InputElement(
      elementType: 'dropdown',
      setData: setRegion,
      data: regions,
      value: region,
      placeholder: '지역 선택',
      offset: Offset(0, 355),
    );
  }
}
