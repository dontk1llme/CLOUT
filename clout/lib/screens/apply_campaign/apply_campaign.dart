import 'package:clout/providers/campaign_apply_controller.dart';
import 'package:clout/providers/fee_controller.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/widgets/pay_dialog.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/input/input_elements/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

class ApplyCampaign extends StatefulWidget {
  ApplyCampaign({super.key});

  @override
  State<ApplyCampaign> createState() => _ApplyCampaignState();
}

class _ApplyCampaignState extends State<ApplyCampaign> {
  final ScrollController _scrollController = ScrollController();

  final applyController =
      Get.put(CampaginApplyController(), tag: 'campaignApply');
  final feeController = Get.find<FeeController>(tag: 'campaignApply');

  doApply() {
    if (applyController.agreed) {
      applyController.applyCampaign().then((_) {
        showSnackBar();
      }).catchError((error) {
        showSnackBar(); // 실패 에러
      });
      Get.back();
    } else {
      // showCustomToast();
      Fluttertoast.showToast(msg: '개인정보 수집 및 이용에 동의해주세요');
    }
  }

  showSnackBar() {
    Get.snackbar(
      '',
      '',
      // snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 4),
      titleText: Text(
        '🎉 캠페인 지원 완료',
        style: style.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '캠페인 지원을 성공적으로 마쳤어요',
            style: style.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Text(
            '클라우터님께서 채택되시길 바라요! 👍',
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
    return GetBuilder<CampaginApplyController>(
      tag: 'campaignApply',
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 3,
            headerTitle: '못골정미소 백미 5kg',
          ),
        ),
        body: Container(
          // color: Colors.blue,
          width: double.infinity,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: BouncingListview(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '체험단 신청',
                    style: style.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '신청 한 마디',
                    style: style.textTheme.headlineSmall,
                  ),
                  Text('광고주가 참고할 만한 한 마디를 남겨 주세요!'),
                  SizedBox(height: 10),
                  TextInput(
                    setData: controller.setOneSay,
                    placeholder: '클라우터님을 자유롭게 어필해보세요.',
                    maxLength: 300,
                    maxValue: -1,
                    minLines: 7,
                    maxLines: 7,
                  ),
                  SizedBox(height: 10),
                  /////// 광고비가 있다면(추후 협의인 광고라면.)
                  Text(
                    '희망 광고비',
                    style: style.textTheme.headlineSmall,
                  ),
                  PayDialog(
                    title: '희망 광고비',
                    hintText: '희망 광고비',
                    controllerTag: 'campaignApply',
                  ),
                  SizedBox(height: 20),
                  Text(
                    '개인정보 수집 약관',
                    style: style.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.grey[200],
                    ),
                    child: Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      radius: Radius.circular(50),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            '개인 정보 약관 개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관개인 정보 약관',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: style.colors['main1'],
                        value: controller.agreed,
                        onChanged: (value) => controller.setAgreed(value),
                      ),
                      Text(
                        '개인정보 수집 및 이용에 동의합니다.',
                        style:
                            style.textTheme.bodyMedium?.copyWith(height: 1.2),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  BigButton(
                    title: '지원하기',
                    function: doApply,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
