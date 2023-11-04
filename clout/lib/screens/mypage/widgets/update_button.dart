import 'package:clout/providers/user_controller.dart';
import 'package:clout/screens/mypage/info_update/advertiser_update.dart';
import 'package:clout/screens/mypage/info_update/clouter_update.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class UpdateButton extends StatelessWidget {
  UpdateButton({super.key});

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        userController.clouter
            ? Get.to(ClouterUpdate())
            : Get.to(AdvertiserUpdate());
      }, //클라우터
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
