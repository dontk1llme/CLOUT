import 'package:flutter/material.dart';
import 'style.dart' as style;

void main() {
  runApp(
    
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
      ),
      home: Scaffold(
        backgroundColor: Colors.white, // 배경색을 흰색으로 변경
        body: MyApp(),
      ),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '안녕', // 텍스트 내용
      style: style.textTheme.titleLarge?.copyWith(color: style.colors['main1']), // 스타일 설정 예시
    );
  }
}