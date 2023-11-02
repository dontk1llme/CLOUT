import 'package:flutter/material.dart';
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/buttons/filter_button.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';

// controllers
import 'package:clout/providers/infinite_scroll_controller.dart';

class ClouterLikedCampaign extends GetView<InfiniteScrollController> {
  ClouterLikedCampaign({super.key});

  Campaign campaign = Campaign();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Get.put(InfiniteScrollController());
    return GetBuilder<InfiniteScrollController>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '관심있는 캠페인 목록',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          // FilterButton(),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth > 600 ? 4 : 2,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
              mainAxisSpacing: screenWidth > 400 ? 15 : 10,
            ),
            itemBuilder: (_, index) {
              // print(controller.hasMore);
              if (index < controller.data.length) {
                return CampaignItemBox(
                  category: controller.data[index].category,
                  productName: controller.data[index].productName,
                  pay: controller.data[index].pay,
                  campaignSubject: controller.data[index].campaignSubject,
                  applicantCount: controller.data[index].applicantCount,
                  recruitCount: controller.data[index].recruitCount,
                  selectedPlatform: controller.data[index].selectedPlatform,
                  starRating: controller.data[index].starRating,
                  firstImg: controller.data[index].firstImg,
                );
              }

              if (controller.hasMore || controller.isLoading) {
                return Center(child: RefreshProgressIndicator());
              }

              // if (index == controller.data.length) {
              //   return controller.hasMore
              //       ? Center(child: CircularProgressIndicator())
              //       : Container();
              // }

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('데이터의 마지막 입니다'),
                  IconButton(
                    onPressed: () {
                      controller.reload();
                    },
                    icon: Icon(Icons.refresh_outlined),
                  ),
                ],
              );
            },
            itemCount: controller.data.length + 1,
          ),
        ),
      ),
    );
  }
}
