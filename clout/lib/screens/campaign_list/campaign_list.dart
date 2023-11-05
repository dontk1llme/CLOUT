import 'package:clout/utilities/bouncing_listview.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/common/main_drawer.dart';
import 'package:clout/widgets/search_detail_bottom_sheet/search_detail_button.dart';
import 'package:clout/widgets/list/category_list.dart';
import 'package:clout/widgets/input/search_bar.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:clout/widgets/header/header.dart';

// controllers
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';

// class Campaign {
//   int campaignId = 1;
//   String category = '음식';
//   String productName = '못골정미소 백미 5kg';
//   int pay = 1000;
//   String campaignSubject = '못골영농조합법인';
//   int applicantCount = 2;
//   int recruitCount = 5;
//   List<String> selectedPlatform = [
//     "YouTube",
//     // "Instagram",
//     "TikTok",
//   ];
//   int starRating = 20;
//   String firstImg = 'assets/images/itemImage.jpg';
// }

class CampaignList extends GetView<InfiniteScrollController> {
  CampaignList({super.key});

  var campaignId = Get.arguments;

  Campaign campaign = Campaign();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final infiniteController = Get.put(InfiniteScrollController());
    infiniteController.toggleData(false);
    return GetBuilder<InfiniteScrollController>(
        builder: (controller) => Scaffold(
              drawer: MyDrawer(),
              backgroundColor: style.colors['white'],
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: Header(
                  header: 1,
                  headerTitle: '캠페인 목록',
                ),
              ),
              body: BouncingListview(
                child: Column(
                  children: [
                    MySearchBar(),
                    CategoryList(),
                    SearchDetailButton(),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '전체보기',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenWidth > 600 ? 4 : 2,
                        crossAxisSpacing: 0,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: screenWidth > 400 ? 3 : 0,
                      ),
                      controller: controller.scrollController.value,
                      itemBuilder: (_, index) {
                        print(controller.hasMore);
                        print(controller.data);
                        print(controller.data.length);
                        if (index < controller.data.length) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: CampaignItemBox(
                              category: controller.data[index].category,
                              productName: controller.data[index].productName,
                              pay: controller.data[index].pay,
                              campaignSubject:
                                  controller.data[index].campaignSubject,
                              applicantCount:
                                  controller.data[index].applicantCount,
                              recruitCount: controller.data[index].recruitCount,
                              selectedPlatform:
                                  controller.data[index].selectedPlatform,
                              starRating: controller.data[index].starRating,
                              firstImg: controller.data[index].firstImg,
                            ),
                          );
                        }

                        if (controller.hasMore || controller.isLoading) {
                          return Center(child: RefreshProgressIndicator());
                        }

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
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ));
  }
}
