import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;
import 'package:loading_indicator/loading_indicator.dart';

class ClouterInfiniteScrollBody extends StatelessWidget {
  const ClouterInfiniteScrollBody({super.key, required this.controllerTag});

  final controllerTag;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
          print(controller.hasMore);
          print(controller.data);
          print(controller.data.length);
          if (index < controller.data.length / 2) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClouterItemBox(
                    clouterId: controller.data[index].clouterId,
                    userId: controller.data[index].userId,
                    avgScore: controller.data[index].avgScore,
                    minCost: controller.data[index].minCost,
                    categoryList: controller.data[index].categoryList,
                    // contractCount: controller.data[index].contractCount,
                    channelList: controller.data[index].channelList,
                    // firstImg: controller.data[index].firstImg, // 💥 사진 추가하기
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClouterItemBox(
                    clouterId: controller.data[index].clouterId,
                    userId: controller.data[index].userId,
                    avgScore: controller.data[index].avgScore,
                    minCost: controller.data[index].minCost,
                    categoryList: controller.data[index].categoryList,
                    // contractCount: controller.data[index].contractCount,
                    channelList: controller.data[index].channelList,
                    // firstImg: controller.data[index].firstImg, // 💥 사진 추가하기
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
