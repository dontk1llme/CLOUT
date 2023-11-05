import 'package:clout/screens/campaign_list/campaign_infinite_scroll_body.dart';
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

// utilities
import 'package:clout/utilities/bouncing_listview.dart';

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
                    CampaignInfiniteScrollBody(),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ));
  }
}
