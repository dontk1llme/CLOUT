import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/list/widgets/campaign_infinite_scroll_body.dart';

// controllers
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ClouterMyCampaign extends GetView<InfiniteScrollController> {
  ClouterMyCampaign({super.key});

  final infiniteController =
      Get.put(InfiniteScrollController(), tag: 'clouterMyCampaign');
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    infiniteController.setEndPoint('/member-service/v1/applies/clouters');
    infiniteController.setParameter(
        '?clouter=${userController.memberId}&&type='); // 💥 typeEnum..? 추가하기
    infiniteController.toggleData(false);
    return GetBuilder<InfiniteScrollController>(
      tag: 'clouterMyCampaign',
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '신청한 캠페인',
          ),
        ),
        body: SingleChildScrollView(
          controller: controller.scrollController.value,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CampaignInfiniteScrollBody(controllerTag: 'clouterMyCampaign'),
              infiniteController.hasMore
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 40),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                            child: LoadingIndicator(
                          indicatorType: Indicator.ballRotateChase,
                          colors: [
                            style.colors['main1-4']!,
                            style.colors['main1-3']!,
                            style.colors['main1-2']!,
                            style.colors['main1-1']!,
                            style.colors['main1']!,
                          ],
                        )),
                      ),
                    )
                  : Container(
                      height: 30,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
