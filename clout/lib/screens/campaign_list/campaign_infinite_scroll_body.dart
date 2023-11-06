import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CampaignInfiniteScrollBody extends StatelessWidget {
  const CampaignInfiniteScrollBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<InfiniteScrollController>(
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
                  child: CampaignItemBox(
                    category: controller.data[2 * index].category,
                    productName: controller.data[2 * index].productName,
                    pay: controller.data[2 * index].pay,
                    campaignSubject: controller.data[2 * index].campaignSubject,
                    applicantCount: controller.data[2 * index].applicantCount,
                    recruitCount: controller.data[2 * index].recruitCount,
                    selectedPlatform:
                        controller.data[2 * index].selectedPlatform,
                    starRating: controller.data[2 * index].starRating,
                    firstImg: controller.data[2 * index].firstImg,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CampaignItemBox(
                    category: controller.data[2 * index + 1].category,
                    productName: controller.data[2 * index + 1].productName,
                    pay: controller.data[2 * index + 1].pay,
                    campaignSubject:
                        controller.data[2 * index + 1].campaignSubject,
                    applicantCount:
                        controller.data[2 * index + 1].applicantCount,
                    recruitCount: controller.data[2 * index + 1].recruitCount,
                    selectedPlatform:
                        controller.data[2 * index + 1].selectedPlatform,
                    starRating: controller.data[2 * index + 1].starRating,
                    firstImg: controller.data[2 * index + 1].firstImg,
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
