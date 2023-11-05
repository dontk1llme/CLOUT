import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/screens/mypage/info_modify/advertiser_modify.dart';
import 'package:clout/screens/mypage/info_modify/clouter_modify.dart';
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
        userController.user == -1
            ? Get.to(ClouterModify())
            : Get.to(AdvertiserModify());
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
