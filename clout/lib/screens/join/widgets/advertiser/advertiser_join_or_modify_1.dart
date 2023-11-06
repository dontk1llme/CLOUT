import 'package:clout/providers/user_controllers/advertiser_info_controller.dart';
import 'package:clout/screens/join/widgets/join_input.dart';
import 'package:clout/widgets/input/address_input.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

class AdvertiserJoinOrModify1 extends StatelessWidget {
  const AdvertiserJoinOrModify1(
      {super.key, required this.modifying, required this.controllerTag});
  final modifying;
  final controllerTag;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdvertiserInfoController>(
      tag: controllerTag,
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '1. 업체 정보',
            style: style.textTheme.headlineMedium,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          JoinInput(
            keyboardType: TextInputType.text,
            maxLength: 20,
            title: '업체명 입력',
            label: '업체명',
            setState: controller.setBusinessName,
            enabled: true,
          ),
          SizedBox(height: 10),
          JoinInput(
            keyboardType: TextInputType.text,
            maxLength: 20,
            title: '대표 이름 입력',
            label: '대표 이름',
            setState: controller.setHeadName,
            enabled: true,
          ),
          SizedBox(height: 10),
          JoinInput(
            keyboardType: TextInputType.number,
            maxLength: 10,
            title: '사업자등록번호 입력',
            label: '사업자등록번호',
            setState: controller.setBusinessNumber,
            enabled: true,
          ),
          SizedBox(height: 10),
          AddressInput(controllerTag: controllerTag),
        ],
      ),
    );
  }
}
