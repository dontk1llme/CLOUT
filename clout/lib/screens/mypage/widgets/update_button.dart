import 'package:clout/screens/mypage/advertiser_update.dart';
import 'package:clout/screens/mypage/clouter_update.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      // 광고주냐 클라우터냐에 따라 회원정보수정 페이지 바뀌게 해야 함
      // onPressed: () {Get.to(AdvertiserUpdate());}, //광고주
      onPressed: () {Get.to(ClouterUpdate());}, //클라우터
      icon: Icon(
        Icons.manage_accounts,
        size: 18,
        color: Colors.white,
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(style.colors['main1'])),
      label: Text(
        "회원정보 수정",
      ),
    );
  }
}
