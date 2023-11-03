import 'package:clout/providers/clouter_register_controller.dart';
import 'package:clout/providers/image_picker_provider.dart';
import 'package:clout/screens/join/widgets/clouter/clouter_join_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../style.dart' as style;

import 'package:clout/screens/join/widgets/big_button.dart';

import 'package:clout/screens/join/widgets/clouter/clouter_join_1.dart';
import 'package:clout/screens/join/widgets/clouter/clouter_join_3.dart';
import 'package:clout/screens/join/widgets/clouter/clouter_join_4.dart';

class ClouterJoin extends ConsumerStatefulWidget {
  const ClouterJoin({super.key});

  @override
  ClouterJoinState createState() => ClouterJoinState();
}

class ClouterJoinState extends ConsumerState<ClouterJoin> {
  int pageNum = 1;
  double percent = 1 / 4;

  final registerController = Get.put(ClouterRegisterController());

  void setPageNum(int newPageNum) {
    bool canGoNext = false;
    switch (newPageNum) {
      case 2:
        if (registerController.canGoSecondPage()) {
          canGoNext = true;
        }
        break;
      case 3:
        if (registerController.canGoThirdPage() == 0) {
          Fluttertoast.showToast(msg: '비밀번호 확인이 일치하지 않습니다 😅');
          return;
        } else if (registerController.canGoThirdPage() == 1) {
          canGoNext = true;
        }
        break;
      case 4:
        canGoNext = true;
        break;
    }
    if (canGoNext) {
      setState(() {
        pageNum = newPageNum;
        if (pageNum != 5) percent = newPageNum / 4;
      });
      canGoNext = false;
    } else {
      Fluttertoast.showToast(msg: '모든 항목을 입력해주세요 🤗');
    }
  }

  // Future runImageProvider() async {
  //   final newImages = ref.watch(imagePickerProvider);
  // }

  showSnackBar() {
    Get.snackbar(
      '',
      '',
      // snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 4),
      titleText: Text(
        '🥳 회원 가입 완료',
        style: style.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '가입을 진심으로 축하드려요',
            style: style.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Text(
            '성공적인 광고 계약을 기원할게요 🙌',
            style: style.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      borderWidth: 5,
      borderColor: style.colors['main1'],
      margin: EdgeInsets.only(
        top: 15,
        left: 20,
        right: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 회원 가입도중 뒤로 갈 경우 사진을 담아뒀던 state가 만료될 수 있도록 초기화
    ref.invalidate(imagePickerProvider);
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
                                children: [
                                  Image.asset(
                                    'assets/images/Clout_Logo.png',
                                    width: 100,
                                  ),
                                  Text(' 와 함께',
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
                            function: () async {
                              if (pageNum < 4) {
                                if (pageNum != 2) {
                                  setPageNum(pageNum + 1);
                                } else {
                                  // await runImageProvider();
                                  setPageNum(pageNum + 1);
                                }
                              } else {
                                registerController.printAll();
                                showSnackBar();
                                Get.offNamed('/login');
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
