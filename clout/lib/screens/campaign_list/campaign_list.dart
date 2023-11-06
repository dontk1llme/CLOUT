import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/screens/campaign_list/campaign_infinite_scroll_body.dart';
import 'package:clout/widgets/common/main_drawer.dart';
import 'package:clout/widgets/search_detail_bottom_sheet/search_detail_button.dart';
import 'package:clout/widgets/list/category_list.dart';
import 'package:clout/widgets/input/search_bar.dart';
import 'package:clout/widgets/header/header.dart';

// utilities
import 'package:clout/utilities/bouncing_listview.dart';

// controllers
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';

class CampaignList extends StatelessWidget {
  CampaignList({super.key});

  final infiniteController =
      Get.put(InfiniteScrollController(), tag: 'campaignList');

  @override
  Widget build(BuildContext context) {
    infiniteController.setEndPoint('/');
    final screenWidth = MediaQuery.of(context).size.width;
    infiniteController.toggleData(false);
    return GetBuilder<InfiniteScrollController>(
        tag: 'campaignList',
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
                    CampaignInfiniteScrollBody(controllerTag: 'campaignList'),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ));
  }
}
