import 'package:flutter/material.dart';
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/list/widgets/campaign_infinite_scroll_body.dart';

// controllers
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';

class ClouterMyCampaign extends GetView<InfiniteScrollController> {
  ClouterMyCampaign({super.key});

  final infiniteController =
      Get.put(InfiniteScrollController(), tag: 'clouterMyCampaign');
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    infiniteController.setEndPoint('/v1/applies/clouters');
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
        body: Padding(
          padding: const EdgeInsets.all(0),
          // FilterButton(),
          child: CampaignInfiniteScrollBody(controllerTag: 'clouterMyCampaign'),
        ),
      ),
    );
  }
}
