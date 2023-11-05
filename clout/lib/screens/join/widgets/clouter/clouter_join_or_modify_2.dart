import 'package:clout/providers/user_controllers/clouter_info_controller.dart';
import 'package:clout/screens/join/widgets/join_input.dart';
import 'package:clout/widgets/image_pickder/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class ClouterJoinOrModify2 extends StatefulWidget {
  ClouterJoinOrModify2(
      {super.key, required this.modifying, required this.controllerTag});
  final modifying;
  final controllerTag;

  @override
  ClouterJoinOrModify2State createState() => ClouterJoinOrModify2State();
}

class ClouterJoinOrModify2State extends State<ClouterJoinOrModify2> {
  var obscured = true;
  var doubleId = 1;
  Icon suffixIcon = Icon(
    Icons.visibility_outlined,
    color: Colors.grey,
  );

  setDoubleId(input) {
    setState(() {
      //없을 때 0
      //중복이면 1
      //가능하면 2
      //지금은 편의상 중복 아니라고 함
      doubleId = 2;
      print(doubleId);
    });
  }

  setObscured() {
    setState(() {
      obscured = !obscured;
      print(obscured);
      if (obscured) {
        suffixIcon = Icon(
          Icons.visibility_outlined,
          color: Colors.grey,
        );
      } else {
        suffixIcon = Icon(
          Icons.visibility_off_outlined,
          color: Colors.grey,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClouterInfoController>(
      tag: widget.controllerTag,
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
                  enabled: !widget.modifying,
                ),
                Positioned(
                  right: 10,
                  top: 2,
                  child: ElevatedButton(
                    onPressed: () => setDoubleId(1),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: style.colors['main1'],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('중복 확인'),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: doubleId == 1
                  ? Text(
                      '아이디 중복 확인이 필요해요',
                      style: style.textTheme.bodySmall?.copyWith(
                        color: style.colors['gray'],
                        height: 1.5,
                      ),
                    )
                  : doubleId == 2
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
                  obscured: obscured,
                  enabled: true,
                ),
                Positioned(
                  top: 3,
                  right: 5,
                  child: IconButton(onPressed: setObscured, icon: suffixIcon),
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
                  obscured: obscured,
                  enabled: true,
                ),
                Positioned(
                  top: 3,
                  right: 5,
                  child: IconButton(onPressed: setObscured, icon: suffixIcon),
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
                ImageWidget(controllerTag: widget.controllerTag),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
