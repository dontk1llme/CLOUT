import 'package:clout/providers/clouter_register_controller.dart';
import 'package:clout/providers/image_picker_provider.dart';
import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/screens/join/widgets/clouter/clouterJoin2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../style.dart' as style;

import 'package:clout/screens/join/widgets/big_button.dart';

import 'package:clout/screens/join/widgets/clouter/clouterJoin1.dart';
import 'package:clout/screens/join/widgets/clouter/clouterJoin3.dart';
import 'package:clout/screens/join/widgets/clouter/clouterJoin4.dart';

class ClouterJoin extends ConsumerStatefulWidget {
  const ClouterJoin({super.key});

  @override
  _ClouterJoinState createState() => _ClouterJoinState();
}

class _ClouterJoinState extends ConsumerState<ClouterJoin> {
  int pageNum = 1;
  double percent = 1 / 4;

  void setPageNum(int newPageNum) {
    setState(() {
      pageNum = newPageNum;
      if (pageNum != 5) percent = newPageNum / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 회원 가입도중 뒤로 갈 경우 사진을 담아뒀던 state가 만료될 수 있도록 초기화
    ref.invalidate(imagePickerProvider);
    Get.delete<PlatformSelectController>(force: true);
    Get.delete<ClouterRegisterController>(force: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SizedBox(
            width: double.infinity,
            child: BouncingListview(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 0,
                        child: FractionallySizedBox(
                          widthFactor: 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 80),
                              Text('가입하고', style: style.textTheme.titleMedium),
                              Row(
                                children: <Widget>[
                                  Text('CLOUT',
                                      style: style.textTheme.titleMedium
                                          ?.copyWith(
                                              color: style.colors['main1'])),
                                  Text('와 함께',
                                      style: style.textTheme.titleMedium),
                                ],
                              ),
                              Text('매칭해요', style: style.textTheme.titleMedium),
                              SizedBox(height: 10),
                              LinearPercentIndicator(
                                animation: true,
                                animationDuration: 1000,
                                padding: EdgeInsets.zero,
                                percent: percent,
                                animateFromLastPercent: true,
                                lineHeight: 10,
                                backgroundColor: style.colors['category'],
                                progressColor: style.colors['main1'],
                                barRadius: Radius.circular(5),
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(children: [
                          //페이지별로 보여주기
                          if (pageNum == 1) ClouterJoin1(),
                          if (pageNum == 2) ClouterJoin2(),
                          if (pageNum == 3) ClouterJoin3(),
                          if (pageNum == 4) ClouterJoin4(),
                        ]),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: FractionallySizedBox(
                          widthFactor: 0.9,
                          child: BigButton(
                            title: pageNum == 4
                                ? '완료'
                                : '다음', // pageNum에 따라 버튼 텍스트 변경
                            function: () {
                              if (pageNum <= 4) {
                                setPageNum(pageNum + 1);
                              }
                              if (pageNum == 5) {
                                Get.toNamed('/login');
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
