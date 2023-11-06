import 'package:clout/providers/user_controllers/clouter_info_controller.dart';
import 'package:clout/screens/join/widgets/join_input.dart';
import 'package:clout/widgets/input/address_input.dart';
import 'package:clout/widgets/input/input_elements/widgets/date_input.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:clout/screens/join/numberVerify.dart';

class ClouterJoinOrModify1 extends StatelessWidget {
  ClouterJoinOrModify1({
    super.key,
    required this.modifying,
    required this.controllerTag,
  });

  final controllerTag;
  final modifying;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClouterInfoController>(
      tag: controllerTag,
      builder: (controller) => FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. 기본 정보',
              style: style.textTheme.headlineMedium,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            JoinInput(
              keyboardType: TextInputType.text,
              maxLength: 20,
              title: '이름 입력',
              label: '이름',
              setState: controller.setName,
              initialValue: controller.name,
              enabled: !modifying,
            ),
            SizedBox(height: 10),
            DateInput(controllerTag: controllerTag),
            SizedBox(height: 10),
            Stack(
              children: [
                JoinInput(
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  title: '휴대전화 번호 입력',
                  label: '휴대전화 번호',
                  setState: controller.setPhoneNumber,
                  initialValue: controller.phoneNumber,
                  enabled: true,
                ),
                Positioned(
                  right: 10,
                  top: 2,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => NumberVerify()),
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
            SizedBox(height: 10),
            AddressInput(controllerTag: controllerTag),
          ],
        ),
      ),
    );
  }
}
