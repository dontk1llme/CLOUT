import 'package:clout/providers/clouter_register_controller.dart';
import 'package:clout/providers/image_picker_provider.dart';
import 'package:clout/screens/join/widgets/clouter/widgets/join_input.dart';
import 'package:clout/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:clout/screens/join/widgets/small_button.dart';
import 'package:clout/screens/join/numberVerify.dart';
import 'package:clout/widgets/input/input.dart';

class ClouterJoin2 extends ConsumerStatefulWidget {
  ClouterJoin2({super.key});

  @override
  ClouterJoin2State createState() => ClouterJoin2State();
}

class ClouterJoin2State extends ConsumerState<ClouterJoin2> {
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
    return GetBuilder<ClouterRegisterController>(
      builder: (controller) => FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2. 계정 설정',
              style: style.textTheme.titleSmall,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            JoinInput(
              keyboardType: TextInputType.text,
              maxLength: 20,
              title: '닉네임 입력',
              label: '닉네임',
              setState: controller.setNickName,
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
            SizedBox(
              height: 25,
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.only(left: 180),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerRight,
                ),
                onPressed: () {},
                child: doubleId == 1
                    ? Text(
                        '아이디 중복 확인이 필요해요',
                        style: style.textTheme.bodyMedium?.copyWith(
                          color: style.colors['gray'],
                          height: 2,
                        ),
                      )
                    : doubleId == 2
                        ? Text(
                            '사용 가능한 아이디입니다',
                            style: style.textTheme.bodyMedium?.copyWith(
                              color: style.colors['main1'],
                              height: 2,
                            ),
                          )
                        : Text(
                            '이미 사용 중인 아이디입니다',
                            style: style.textTheme.bodyMedium?.copyWith(
                              color: style.colors['Darkgray'],
                              height: 2,
                            ),
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
                ),
                Positioned(
                  top: 3,
                  right: 5,
                  child: IconButton(onPressed: setObscured, icon: suffixIcon),
                )
              ],
            ),
            SizedBox(height: 10),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    '활동 대표 사진',
                    style: style.textTheme.headlineMedium,
                  ),
                  SizedBox(height: 10),
                  ImageWidget(parentImages: controller.images),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
