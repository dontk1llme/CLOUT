import 'package:clout/widgets/loading_indicator.dart';
import 'package:clout/widgets/refreshable_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/list/widgets/campaign_infinite_scroll_body.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';

class AdvertiserMycampaign extends GetView<InfiniteScrollController> {
  AdvertiserMycampaign({super.key});

  final infiniteController =
      Get.put(InfiniteScrollController(), tag: 'advertiserMyCampaign');

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    infiniteController.setCurrentPage(0);
    infiniteController
        .setEndPoint('/advertisement-service/v1/advertisements/advertisements');
    infiniteController.setParameter(
        '?advertiserId=${userController.memberId}&page=${infiniteController.currentPage}&size=${10}');
    final screenHeight = MediaQuery.of(context).size.height;
    infiniteController.reload();
    print('왜 아무것도 안되지?');
    return GetBuilder<InfiniteScrollController>(
      tag: 'advertiserMyCampaign',
      builder: (controller) => Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Header(
              header: 4,
              headerTitle: '내 캠페인 목록',
            ),
          ),
          body: RefreshablePage(
            controller: controller.scrollController.value,
            child: Column(
              children: [
                CampaignInfiniteScrollBody(
                    controllerTag: 'advertiserMyCampaign'),
                infiniteController.isLoading
                    ? Column(
                        children: [
                          SizedBox(height: screenHeight / 3),
                          SizedBox(
                              height: 70,
                              child: Center(child: LoadingWidget())),
                          SizedBox(height: 20),
                          Text(
                            '내 켐페인을 불러오는 중입니다.\n잠시만 기다려 주세요.',
                            style: style.textTheme.headlineLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    : Container()
              ],
            ),
          )),
    );
  }
}
