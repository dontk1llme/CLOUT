import 'package:clout/hooks/apis/authorized_api.dart';
import 'package:clout/providers/user_controllers/clouter_controller.dart';
import 'package:clout/providers/user_controllers/clouter_info_controller.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/screens/register_or_modify/clouter/widgets/clouter_join_or_modify_1.dart';
import 'package:clout/screens/register_or_modify/clouter/widgets/clouter_join_or_modify_2.dart';
import 'package:clout/screens/register_or_modify/clouter/widgets/clouter_join_or_modify_3.dart';
import 'package:clout/screens/register_or_modify/clouter/widgets/clouter_join_or_modify_4.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

// widgets
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';

class ClouterModify extends StatelessWidget {
  ClouterModify({super.key});
  final clouterController = Get.put(ClouterController());
  final userController = Get.find<UserController>();
  final controller = Get.put(ClouterInfoController(), tag: 'clouterModify');

  loadClouterInfo() async {
    AuthorizedApi authorizedApi = AuthorizedApi();
    var response = await authorizedApi.getRequest(
        '/member-service/v1/clouters/', userController.memberId);
    // response = {'statusCode' : 값, 'body' : 값}

    print(response['statusCode']);
    print(response['body']);
    print(response['body']);
  }

  @override
  Widget build(BuildContext context) {
    clouterController.setControllerTag('clouterModify');
    controller.runOtherControllers();
    loadClouterInfo();
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
              modifying: true,
              controllerTag: 'clouterModify',
            ),
            ClouterJoinOrModify2(
              modifying: true,
              controllerTag: 'clouterModify',
            ),
            ClouterJoinOrModify3(
              modifying: true,
              controllerTag: 'clouterModify',
            ),
            ClouterJoinOrModify4(
              modifying: true,
              controllerTag: 'clouterModify',
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: BigButton(
                title: '완료', // pageNum에 따라 버튼 텍스트 변경
                function: () {
                  Get.offNamed('/cloutermypage');
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
