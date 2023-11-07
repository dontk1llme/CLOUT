import 'dart:convert';

import 'package:clout/hooks/register_api.dart';
import 'package:clout/providers/user_controllers/clouter_info_controller.dart';
import 'package:clout/screens/join/widgets/join_input.dart';
import 'package:clout/type.dart';
import 'package:clout/widgets/image_pickder/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class ClouterJoinOrModify2 extends StatelessWidget {
  ClouterJoinOrModify2(
      {super.key, required this.modifying, required this.controllerTag});
  final modifying;
  final controllerTag;

  final clouterRegisterController =
      Get.find<ClouterInfoController>(tag: 'clouterRegister');

  //중복 체크 함수
  checkDuplicted() async {
    final RegisterApi registerApi = RegisterApi();

    var responseBody = await registerApi.getRequest(
      '/v1/members/duplicate',
      '?userId=${clouterRegisterController.id}',
    );
    print(responseBody);
    if (responseBody[0] == 200) {
      clouterRegisterController.setDoubleId(2);
    } else {
      clouterRegisterController.setDoubleId(0);
    }
    // print(CheckDuplicated.fromJson(jsonDecode(responseBody)).checkValue);
    // if (responseBody != false) {
    //   var unique =
    //       CheckDuplicated.fromJson(jsonDecode(responseBody)).checkValue;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClouterInfoController>(
      tag: controllerTag,
      builder: (controller) => FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              '2. 계정 설정',
              style: style.textTheme.headlineMedium,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            JoinInput(
              keyboardType: TextInputType.text,
              maxLength: 20,
              title: '닉네임 입력',
              label: '닉네임',
              setState: controller.setNickName,
              initialValue: controller.nickName,
              enabled: true,
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                JoinInput(
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  title: '아이디 입력',
                  label: '아이디',
                  setState: controller.setId,
                  initialValue: controller.id,
                  enabled: !modifying,
                ),
                controllerTag != 'clouterModify'
                    ? Positioned(
                        right: 10,
                        top: 2,
                        child: ElevatedButton(
                          onPressed: checkDuplicted,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: style.colors['main1'],
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text('중복 확인'),
                        ),
                      )
                    : Container(),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: controller.doubleId == 1
                  ? Text(
                      '아이디 중복 확인이 필요해요',
                      style: style.textTheme.bodySmall?.copyWith(
                        color: style.colors['gray'],
                        height: 1.5,
                      ),
                    )
                  : controller.doubleId == 2
                      ? Text(
                          '사용 가능한 아이디입니다',
                          style: style.textTheme.bodySmall?.copyWith(
                            color: style.colors['main1'],
                            height: 1.5,
                          ),
                        )
                      : Text(
                          '이미 사용 중인 아이디입니다',
                          style: style.textTheme.bodySmall?.copyWith(
                            color: Colors.red[300],
                            height: 1.5,
                          ),
                        ),
            ),
            SizedBox(height: 5),
            Stack(
              children: [
                JoinInput(
                  keyboardType: TextInputType.text,
                  maxLength: 30,
                  title: '비밀번호 입력',
                  label: '비밀번호',
                  setState: controller.setPassword,
                  obscured: controller.obscured,
                  enabled: true,
                ),
                Positioned(
                  top: 3,
                  right: 5,
                  child: IconButton(
                    onPressed: controller.setObscured,
                    icon: controller.obscured
                        ? Icon(Icons.visibility_outlined)
                        : Icon(Icons.visibility_off_outlined),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                JoinInput(
                  keyboardType: TextInputType.text,
                  maxLength: 30,
                  title: '비밀번호 확인',
                  label: '비밀번호 확인',
                  setState: controller.setCheckPassword,
                  obscured: controller.obscured,
                  enabled: true,
                ),
                Positioned(
                  top: 3,
                  right: 5,
                  child: IconButton(
                    onPressed: controller.setObscured,
                    icon: controller.obscured
                        ? Icon(Icons.visibility_outlined)
                        : Icon(Icons.visibility_off_outlined),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10),
                Text(
                  '활동 대표 사진',
                  style: style.textTheme.headlineSmall,
                ),
                SizedBox(height: 10),
                ImageWidget(controllerTag: controllerTag),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
