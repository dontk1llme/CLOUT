import 'dart:convert';

import 'package:clout/hooks/phone_number_formatter.dart';
import 'package:clout/hooks/register_api.dart';
import 'package:clout/providers/four_digits_input_controller.dart';
import 'package:clout/providers/user_controllers/advertiser_info_controller.dart';
import 'package:clout/screens/register_or_modify/widgets/number_verify.dart';
import 'package:clout/screens/register_or_modify/widgets/join_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

class AdvertiserJoinOrModify2 extends StatelessWidget {
  AdvertiserJoinOrModify2(
      {super.key, required this.modifying, required this.controllerTag});
  final modifying;
  final controllerTag;

  final advertiserRegisterController =
      Get.find<AdvertiserInfoController>(tag: 'advertiserRegister');

  final RegisterApi registerApi = RegisterApi();

  checkDuplicted() async {
    var responseBody = await registerApi.getRequest(
      '/v1/members/duplicate',
      '?userId=${advertiserRegisterController.id}',
    );
    print('중복확인');
    print(responseBody);
    if (responseBody[0] == 200) {
      advertiserRegisterController.setDoubleId(2);
    } else {
      advertiserRegisterController.setDoubleId(0);
    }
  }

  verify() async {
    var responseBody = await registerApi.getRequest('/v1/members/sendsms',
        '?phoneNumber=${advertiserRegisterController.phoneNumber}');
    print('인증키 sms 발송');
    final pinController =
        Get.find<FourDigitsInputController>(tag: controllerTag);
    pinController.setCorrectPin(responseBody[1]);
    print(pinController.correctPin);
    Get.to(() => NumberVerify(
        phoneNumber: advertiserRegisterController.phoneNumber,
        controllerTag: 'advertiserRegister'));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdvertiserInfoController>(
      tag: controllerTag,
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          Text(
            '2. 담당자 정보 및 계정 설정',
            style: style.textTheme.headlineMedium,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            '담당자 정보',
            style: style.textTheme.headlineMedium,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          JoinInput(
            keyboardType: TextInputType.text,
            maxLength: 20,
            title: '담당자 이름 입력',
            label: '담당자 이름',
            setState: controller.setName,
            enabled: true,
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              JoinInput(
                keyboardType: TextInputType.phone,
                maxLength: 13,
                title: '담당자 휴대전화 번호 입력',
                label: '담당자 휴대전화 번호',
                setState: controller.setPhoneNumber,
                initialValue: controller.phoneNumber,
                enabled: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  PhoneNumberFormatter(),
                ],
              ),
              Positioned(
                right: 10,
                top: 2,
                child: ElevatedButton(
                  onPressed: verify,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: style.colors['main1'],
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('인증'),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            '계정 설정',
            style: style.textTheme.headlineSmall,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              JoinInput(
                keyboardType: TextInputType.text,
                maxLength: 15,
                title: '아이디 입력',
                label: '아이디',
                setState: controller.setId,
                enabled: !modifying,
              ),
              controllerTag != 'advertiserModify'
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
          controllerTag != 'advertiserModify'
              ? Align(
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
                                color: style.colors['Darkgray'],
                                height: 1.5,
                              ),
                            ),
                )
              : SizedBox(height: 10),
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
                      ? Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
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
                      ? Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
