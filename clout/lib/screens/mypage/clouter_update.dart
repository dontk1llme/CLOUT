import 'package:clout/screens/mypage/widgets/clouter_update/clouterUpdate2.dart';
import 'package:clout/screens/mypage/widgets/clouter_update/clouterUpdate3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/screens/join/widgets/big_button.dart';

// widgets
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/mypage/widgets/clouter_update/clouterUpdate1.dart';

class ClouterUpdate extends StatefulWidget {
  const ClouterUpdate({Key? key});

  @override
  _ClouterUpdateState createState() => _ClouterUpdateState();
}

class _ClouterUpdateState extends State<ClouterUpdate> {
  int pageNum = 1;

  void setPageNum(int newPageNum) {
    setState(() {
      pageNum = newPageNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 4,
          headerTitle: '회원 정보 수정',
        ),
      ),
      body: BouncingListview(
        child: Padding(
          padding: EdgeInsets.only(left: 25, top: 15, right: 25, bottom: 15),
          child: ListView(
            shrinkWrap: true,
            children: [
              if (pageNum == 1) 
                ClouterUpdate1(),
              if (pageNum == 2) 
                ClouterUpdate2(),
              if (pageNum == 3)
                ClouterUpdate3(),
                SizedBox(height: 20),
              BigButton(
                title: pageNum == 3 ? '완료' : '다음', // pageNum에 따라 버튼 텍스트 변경
                function: () {
                  if (pageNum <= 3) {
                    setPageNum(pageNum + 1);
                  }
                  if (pageNum == 4) {
                    Get.toNamed('/login');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
