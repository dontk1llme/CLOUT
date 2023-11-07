import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// controllers
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';

// widgets
import 'package:clout/screens/list/widgets/clouter_infinite_scroll_body.dart';
import 'package:clout/widgets/list/category_list.dart';
import 'package:clout/widgets/input/search_bar.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/common/main_drawer.dart';
import 'package:clout/widgets/search_detail_bottom_sheet/search_detail_button.dart';

class ClouterList extends GetView<InfiniteScrollController> {
  ClouterList({super.key});

  var clouterId = Get.arguments;

  Clouter clouter = Clouter();
  final infiniteController =
      Get.put(InfiniteScrollController(), tag: 'clouterList');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    infiniteController.setEndPoint('/clouters');
    infiniteController.setParameter('search...'); // 💥 search condition 추가하기
    infiniteController.toggleData(true);
    return GetBuilder<InfiniteScrollController>(
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
                  SizedBox(height: 10),
                  ClouterInfiniteScrollBody(controllerTag: 'clouterList'),
                  SizedBox(height: 30),
                ],
              ),
            )));
  }
}
