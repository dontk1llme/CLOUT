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
          crossAxisCount: 2,
        ),
        // controller: controller.scrollController.value,
        itemBuilder: (_, index) {
          print('1️⃣');
          print(
              '💥 데이터 : ${controller.data} 👉 campaign_infinite_scroll_body.dart');
          print(
              '💥 데이터 개수 : ${controller.data.length} 👉 campaign_infinite_scroll_body.dart');
          // if (controller.data.isNotEmpty && controller.hasMore) {
          final campaign1 = controller.data[index];
          // return Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: CampaignItemBox(
          //     adCategory: campaign1.adCategory ?? "",
          //     title: campaign1.title,
          //     price: campaign1.price,
          //     companyInfo: campaign1.advertiser.companyInfo,
          //     numberOfSelectedMembers: campaign1.numberOfSelectedMembers,
          //     numberOfRecruiter: campaign1.numberOfRecruiter,
          //     adPlatformList: campaign1.adPlatformList,
          //     advertiserInfo: campaign1.advertiserInfo,
          //     // firstImg: 'images/assets/itemImage.jpg', // 💥 사진 나중에 수정
          //   ),
          // );
          return campaign1;
          // } else {}
          // return Container(color: Colors.red, height: 20);
        },
        itemCount: controller.data.length,
      ),
    );
  }
}
