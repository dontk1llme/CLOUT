import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// controllers
import 'package:clout/providers/scroll_controllers/clouter_infinite_scroll_controller.dart';

// utilities
import 'package:clout/utilities/bouncing_listview.dart';

// widgets
import 'package:clout/widgets/input/search_bar.dart';
import 'package:clout/screens/list/widgets/clouter_infinite_scroll_body.dart';
import 'package:clout/widgets/list/category_list.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/common/main_drawer.dart';
import 'package:clout/widgets/search_detail_bottom_sheet/search_detail_button.dart';

class ClouterList extends GetView<ClouterInfiniteScrollController> {
  ClouterList({super.key});

  final infiniteController =
      Get.put(ClouterInfiniteScrollController(), tag: 'clouterList');

  @override
  Widget build(BuildContext context) {
    /////////////////////////////////////////////////////
    infiniteController.setEndPoint(
        '/member-service/v1/clouters/search?page=${infiniteController.currentPage}&size=${10}&');
    infiniteController.setParameter(
        '/search?page=${infiniteController.currentPage}&size=${10}');
    /////////////////////////////////////////////////////
    return GetBuilder<ClouterInfiniteScrollController>(
        tag: 'clouterList',
        builder: (controller) => Scaffold(
            drawer: MyDrawer(),
            backgroundColor: style.colors['white'],
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: Header(
                  header: 1,
                  headerTitle: '클라우터 목록',
                )),
            body: BouncingListview(
              child: Column(
                children: [
                  MySearchBar(
                    controllerTag: 'clouterList',
                  ),
                  CategoryList(
                    tagName: 'clouterList',
                  ),
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
                  SizedBox(height: 10),
                  ClouterInfiniteScrollBody(controllerTag: 'clouterList'),
                  SizedBox(height: 30),
                ],
              ),
            )));
  }
}
