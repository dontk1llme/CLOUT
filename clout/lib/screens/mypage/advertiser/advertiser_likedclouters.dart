import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

// screens
import 'package:clout/screens/list/widgets/clouter_infinite_scroll_body.dart';

// widgets
import 'package:clout/widgets/header/header.dart';

// controllers
import 'package:clout/providers/scroll_controllers/clouter_infinite_scroll_controller.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AdvertiserLikedclouters extends StatelessWidget {
  AdvertiserLikedclouters({super.key});
  final infiniteController = Get.put(ClouterInfiniteScrollController(),
      tag: 'advertiserLikedClouters');
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    infiniteController.setEndPoint('/member-service/v1/bookmarks/clouter');
    infiniteController.setParameter('?memberId=${userController.memberId}');
    infiniteController.toggleData(true);
    return GetBuilder<ClouterInfiniteScrollController>(
      tag: 'advertiserLikedClouters',
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '관심있는 클라우터 목록',
          ),
        ),
        body: SingleChildScrollView(
          controller: controller.scrollController.value,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ClouterInfiniteScrollBody(
                  controllerTag: 'advertiserLikedClouters'),
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
                          ),
                        ),
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
