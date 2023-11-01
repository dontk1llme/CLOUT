import 'package:clout/providers/platform_input_controller.dart';
import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/screens/join/widgets/clouter/widgets/join_input.dart';
import 'package:flutter/material.dart'
    hide BoxDecoration, BoxShadow; //  기존 BoxShadow 속성을 가려줘야 함
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InputCustomdrop extends StatelessWidget {
  InputCustomdrop({super.key, this.index});
  final index;
  final platformInputController = Get.put(PlatformInputController());

  setId(input) {
    switch (index) {
      case 0:
        platformInputController.setInstagramId(input);
        break;
      case 1:
        platformInputController.setTiktokId(input);
        break;
      case 2:
        platformInputController.setInstagramId(input);
        break;
    }
  }

  setLink(input) {
    switch (index) {
      case 0:
        platformInputController.setInstagramLink(input);
        break;
      case 1:
        platformInputController.setTiktokLink(input);
        break;
      case 2:
        platformInputController.setYoutubeLink(input);
        break;
    }
  }

  setFollower(input) {
    switch (index) {
      case 0:
        platformInputController.setInstagramFollowerCount(input);
        break;
      case 1:
        platformInputController.setTiktokFollowerCount(input);
        break;
      case 2:
        platformInputController.setYoutubeFollowerCount(input);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(PlatformSelectController());
    return GetBuilder<PlatformSelectController>(
        builder: (controller) => AnimatedContainer(
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.all(0),
              height: controller.platforms[index] ? 250 : 0,
              // height: 360,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: style.colors['category'],
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              inset: true),
                        ]),
                    width: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: SizedBox(
                        // height: 200,
                        child: ListView(
                          // 리버스라 맨 아래꺼 기준으로 채워야 함
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            JoinInput(
                                keyboardType: TextInputType.text,
                                maxLength: 30,
                                title: '팔로워 수 / 구독자 수 입력',
                                label: '팔로워 수 / 구독자 수',
                                setState: setId),
                            SizedBox(height: 10),
                            JoinInput(
                                keyboardType: TextInputType.text,
                                maxLength: 30,
                                title: '채널 링크 입력',
                                label: '채널 링크',
                                setState: setLink),
                            SizedBox(height: 10),
                            JoinInput(
                                keyboardType: TextInputType.text,
                                maxLength: 30,
                                title: '계정명/채널명 입력',
                                label: '계정명/채널명',
                                setState: setId),
                            SizedBox(height: 10),
                            Text(
                              '정보 입력',
                              style: style.textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
                .animate(target: controller.platforms[index] ? 0 : 1)
                .fadeOut(duration: Duration(milliseconds: 500)));
  }
}
