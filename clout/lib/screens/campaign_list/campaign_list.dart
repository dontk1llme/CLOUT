import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// widgets
import 'package:clout/screens/campaign_list/campaign_infinite_scroll_body.dart';
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

class CampaignList extends StatefulWidget {
  CampaignList({super.key});

  @override
  _CampaignListState createState() => _CampaignListState();
}

class _CampaignListState extends State<CampaignList> {
  late Future<Campaign> futureCampaign;
  @override
  void initState() {
    super.initState();
    futureCampaign = fetchCampaign('advertisements');
  }

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
