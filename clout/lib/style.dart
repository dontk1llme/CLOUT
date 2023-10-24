import 'package:flutter/material.dart';

// 사용법
// import 'style.dart' as style;


// Text('텍스트 내용', style: style.textTheme.titleLarge);
var textTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.normal),
    titleMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
    titleSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
    headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
    headlineMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.normal), // fontWeight: FontWeight.bold는 필요한 곳에 알아서
    headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
  );

//style: textStyles?.copyWith(color: textColors['red'])
// 물음표 없으면 에러
var colors = {
  'main1': Color(0xFF6B4EFF),
  'main2': Color(0xFF927EFF),  
  'main3': Color(0xFFF6F4FF),
  'gray': Color(0xFF979C9E),
  'logo': Color(0xFF5840D1),
  'text': Color(0xFF1E1E1E),
  'darkgray': Color(0xFF454545),
  'white': Color(0xFFFFFFFF),
  'category': Color(0xFFD4CCFF),
};