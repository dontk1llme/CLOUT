import 'package:clout/providers/clouter_register_controller.dart';
import 'package:clout/screens/join/widgets/clouter/clouter_join_or_modify_1.dart';
import 'package:clout/screens/join/widgets/clouter/clouter_join_or_modify_2.dart';
import 'package:clout/screens/join/widgets/clouter/clouter_join_or_modify_3.dart';
import 'package:clout/screens/join/widgets/clouter/clouter_join_or_modify_4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/screens/join/widgets/big_button.dart';

// widgets
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';

class ClouterUpdate extends StatelessWidget {
  ClouterUpdate({super.key});

  final controller = Get.put(ClouterRegisterController());

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
        child: Column(
          children: [
            ClouterJoinOrModify1(
                modifying: true, controllerTag: 'clouterModify'),
            ClouterJoinOrModify2(
              modifying: true,
              controllerTag: 'clouterModify',
            ),
            ClouterJoinOrModify3(
                modifying: true, controllerTag: 'clouterModify'),
            ClouterJoinOrModify4(
              modifying: true,
              controllerTag: 'clouterUpdate',
            ),
            SizedBox(height: 20),
            BigButton(
              title: '완료', // pageNum에 따라 버튼 텍스트 변경
              function: () {
                Get.toNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
