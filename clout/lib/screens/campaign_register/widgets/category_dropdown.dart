import 'package:clout/widgets/input/input_elements/input_element.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  CategoryDropdown({super.key, this.category, this.setCategory});

  final category;
  final setCategory;

  var categories = [
    '전체',
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
    return InputElement(
      elementType: 'dropdown',
      data: categories,
      value: category,
      placeholder: '카테고리 선택',
      setData: setCategory,
    );
  }
}
