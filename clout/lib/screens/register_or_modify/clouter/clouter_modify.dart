import 'dart:convert';

import 'package:clout/hooks/apis/authorized_api.dart';
import 'package:clout/hooks/apis/login_api.dart';
import 'package:clout/providers/user_controllers/clouter_controller.dart';
import 'package:clout/providers/user_controllers/clouter_info_controller.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/screens/register_or_modify/clouter/widgets/clouter_join_or_modify_1.dart';
import 'package:clout/screens/register_or_modify/clouter/widgets/clouter_join_or_modify_2.dart';
import 'package:clout/screens/register_or_modify/clouter/widgets/clouter_join_or_modify_3.dart';
import 'package:clout/screens/register_or_modify/clouter/widgets/clouter_join_or_modify_4.dart';
import 'package:clout/screens/register_or_modify/widgets/join_input.dart';
import 'package:clout/type.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';

class ClouterModify extends StatefulWidget {
  ClouterModify({super.key});

  @override
  State<ClouterModify> createState() => _ClouterModifyState();
}

class _ClouterModifyState extends State<ClouterModify> {
  final clouterController = Get.put(ClouterController());

  final controller = Get.put(ClouterInfoController(), tag: 'clouterModify');

  AuthorizedApi authorizedApi = AuthorizedApi();

  loadClouterInfo() async {
    var response = await authorizedApi.getRequest(
        '/member-service/v1/clouters/', userController.memberId);
    // response = {'statusCode' : 값, 'body' : 값}
    print(response['statusCode']);
    print(response['body']);
    var clouterData = response['body'];
    var data = Clouter.fromJson(jsonDecode(clouterData));

    controller.loadBeforeModify(data);
  }

  @override
  void initState() {
    clouterController.setControllerTag('clouterModify');
    controller.runOtherControllers();
    loadClouterInfo();
    super.initState();
  }

  updateUserInfo() async {
    await controller.setClouter();
    var response = await authorizedApi.putRequest(
      '/member-service/v1/clouters/${userController.memberId}',
      controller.clouter,
    );
  }

  testLogin() async {
    LoginApi loginApi = LoginApi();
    var loginData = await loginApi.postRequest(
        '/member-service/v1/members/login',
        LoginInfo(controller.id, controller.password));
    if (loginData['login_success'] == true) {
      updateUserInfo();
    }
  }

  showPasswordCheck() {
    Get.defaultDialog(
      title: '비밀번호 확인',
      titlePadding: EdgeInsets.only(top: 20),
      contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      content: GetBuilder<ClouterInfoController>(
        tag: clouterController.controllerTag,
        builder: (controller) => SizedBox(
          height: 60,
          child: Stack(
            children: [
              JoinInput(
                keyboardType: TextInputType.text,
                maxLength: 20,
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
                          Icons.visibility_outlined,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.grey,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: testLogin,
            style: ElevatedButton.styleFrom(
                backgroundColor: style.colors['main1']),
            child: Text("확인"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClouterInfoController>(
      tag: clouterController.controllerTag,
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
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
              FractionallySizedBox(
                widthFactor: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: BigButton(
                    title: '완료', // pageNum에 따라 버튼 텍스트 변경
                    function: showPasswordCheck,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
