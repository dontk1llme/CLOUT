import 'package:clout/providers/user_controllers/advertiser_controller.dart';
import 'package:clout/providers/user_controllers/advertiser_info_controller.dart';
import 'package:clout/screens/join/widgets/advertiser/advertiser_join_or_modify_1.dart';
import 'package:clout/screens/join/widgets/advertiser/advertiser_join_or_modify_2.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

// widgets
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';

class AdvertiserModify extends StatelessWidget {
  AdvertiserModify({super.key});

  final advertiserController = Get.put(AdvertiserController());

  @override
  Widget build(BuildContext context) {
    advertiserController.setControllerTag('advertiserModify');
    final controller = Get.put(
      AdvertiserInfoController(),
      tag: advertiserController.controllerTag,
    );
    controller.runOtherControllers();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 4,
          headerTitle: '회원 정보 수정',
        ),
      ),
      body: Center(
        child: BouncingListview(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              children: [
                AdvertiserJoinOrModify1(
                  modifying: true,
                  controllerTag: advertiserController.controllerTag,
                ),
                SizedBox(height: 30),
                AdvertiserJoinOrModify2(
                  modifying: true,
                  controllerTag: advertiserController.controllerTag,
                ),
                SizedBox(height: 30),
                BigButton(
                  title: '수정완료', // pageNum에 따라 버튼 텍스트 변경
                  function: () {
                    Get.offNamed('/advertisermypage');
                  },
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
