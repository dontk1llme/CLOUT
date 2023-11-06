import 'package:flutter/material.dart';
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/campaign_list/campaign_infinite_scroll_body.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';

class ClouterLikedCampaign extends GetView<InfiniteScrollController> {
  ClouterLikedCampaign({super.key});

  final infiniteController =
      Get.put(InfiniteScrollController(), tag: 'clouterLikedCampaign');
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    infiniteController.setEndPoint(
        '?clouterId=${userController.userId}&&page=${infiniteController.currentPage}&&size=${10}');
    infiniteController.toggleData(false);
    return GetBuilder<InfiniteScrollController>(
      tag: 'clouterLikedCampaign',
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '관심있는 캠페인 목록',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          // FilterButton(),
          child:
              CampaignInfiniteScrollBody(controllerTag: 'clouterLikedCampaign'),
        ),
      ),
    );
  }
}
