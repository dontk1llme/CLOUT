import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/screens/join/widgets/join_input.dart';
import 'package:clout/widgets/search_detail_bottom_sheet/widgets/followercount_state_dialog.dart';
import 'package:flutter/material.dart'
    hide BoxDecoration, BoxShadow; //  기존 BoxShadow 속성을 가려줘야 함
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InputCustomdrop extends StatelessWidget {
  InputCustomdrop({super.key, this.index});
  final index;

  @override
  Widget build(BuildContext context) {
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    index != 2 ? '팔로워 수' : '구독자 수',
                                    style:
                                        style.textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                FollowercountStateDialog(
                                  controllerTag: 'clouterRegister',
                                  title: index != 2 ? '팔로워 수' : '구독자 수',
                                  hintText: '팔로워/구독자 수 입력',
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            JoinInput(
                              keyboardType: TextInputType.text,
                              maxLength: 30,
                              title: index != 2 ? '계정 링크 입력' : '채널 링크 입력',
                              label: index != 2 ? '계정 링크' : '채널 링크',
                              index: index,
                              setState: controller.setLink,
                              enabled: true,
                            ),
                            SizedBox(height: 10),
                            JoinInput(
                              keyboardType: TextInputType.text,
                              maxLength: 30,
                              title: index != 2 ? '계정명 입력' : '채널명 입력',
                              label: index != 2 ? '계정명' : '채널명',
                              index: index,
                              setState: controller.setId,
                              enabled: true,
                            ),
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
