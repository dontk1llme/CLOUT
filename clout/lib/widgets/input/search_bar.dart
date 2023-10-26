import 'package:flutter/material.dart';
import '../../style.dart' as style;

class MySearchBar extends StatelessWidget {
  MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: "검색어를 입력하세요..",
            prefixIcon: Icon(
              Icons.search,
              size: 32,
              color: style.colors['main1'],
            ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(50),
            // ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Color(0xFF979C9E))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(width: 3, color: Color(0xFF927EFF)),
            ),
          ),
        ));
  }
}
