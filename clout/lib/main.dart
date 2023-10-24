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
    return Center(
      child: Container( decoration: BoxDecoration(
              color: style.colors['white'], // 박스의 배경색
              borderRadius: BorderRadius.circular(10), // 박스의 모서리 둥글게
              boxShadow: style.shadows['shadow'],
            ),
      child: Text(
              '안녕', // 텍스트 내용
              style: style.textTheme.titleSmall?.copyWith(color: style.colors['main1']), // 텍스트 스타일
            ),
       ),
    );
    
  }
}