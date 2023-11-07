import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';
import 'package:clout/type.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CampaignInfiniteScrollBody extends StatelessWidget {
  const CampaignInfiniteScrollBody({super.key, required this.controllerTag});

  final controllerTag;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfiniteScrollController>(
      tag: controllerTag,
      builder: (controller) => MasonryGridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        controller: controller.scrollController.value,
        itemBuilder: (_, index) {
          print('1️⃣');
          print(
              '💥 데이터 : ${controller.data} 👉 campaign_infinite_scroll_body.dart');
          print(
              '💥 데이터 개수 : ${controller.data.length} 👉 campaign_infinite_scroll_body.dart');
          if (index < controller.data.length / 2 &&
              controller.data.isNotEmpty) {
            final campaign1 = controller.data[2 * index];
            final campaign2 = controller.data[2 * index + 1];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CampaignItemBox(
                    adCategory: campaign1.adCategory!,
                    title: campaign1.title!,
                    price: campaign1.price!,
                    companyInfo: campaign1.companyInfo!,
                    numberOfSelectedMembers: campaign1.numberOfSelectedMembers!,
                    numberOfRecruiter: campaign1.numberOfRecruiter!,
                    adPlatformList: campaign1.adPlatformList!,
                    advertiserInfo: campaign1.advertiserInfo!,
                    firstImg: 'images/assets/itemImage.jpg', // 💥 사진 나중에 수정
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CampaignItemBox(
                    adCategory: campaign2.adCategory!,
                    title: campaign2.title!,
                    price: campaign2.price!,
                    companyInfo: campaign2.companyInfo!,
                    numberOfSelectedMembers: campaign2.numberOfSelectedMembers!,
                    numberOfRecruiter: campaign2.numberOfRecruiter!,
                    adPlatformList: campaign2.adPlatformList!,
                    advertiserInfo: campaign2.advertiserInfo!,
                    firstImg: 'images/assets/itemImage.jpg', // 💥 사진 나중에 수정
                  ),
                ),
              ],
            );
          }

          if (controller.hasMore || controller.isLoading) {
            return Padding(
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
            );
          }

          return SizedBox(height: 30);
        },
        itemCount: (controller.data.length / 2).floor() + 1,
      ),
    );
  }
}
