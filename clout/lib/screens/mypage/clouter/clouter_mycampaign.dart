import 'package:flutter/material.dart';
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/loading_indicator.dart';
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
    infiniteController.setCurrentPage(0);
    infiniteController.setEndPoint(
        '/advertisement-service/v1/applies/clouters?clouterId=${userController.memberId}&page=${infiniteController.currentPage}&size=${10}');
    infiniteController.setParameter('&type=WAITING'); // 💥 typeEnum..? 추가하기
    infiniteController.getData();
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
                        child: LoadingWidget(),
                      ),
                    )
                  : Container(
                      height: 700,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
