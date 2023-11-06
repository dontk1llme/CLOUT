import 'package:clout/screens/clouter/clouter_infinite_scroll_body.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// controllers
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';

// widgets
import 'package:clout/widgets/list/category_list.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';
import 'package:clout/widgets/input/search_bar.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/common/main_drawer.dart';
import 'package:clout/widgets/search_detail_bottom_sheet/search_detail_button.dart';

// class Clouter {
//   int clouterId = 1;
//   String nickname = '모카우유';
//   int starRating = 20;
//   int fee = 500000;
//   String category = '반려동물';
//   int contractCount = 5;
//   List<String> selectedPlatform = [
//     "YouTube",
//     "Instagram",
//     "TikTok",
//   ];
//   String firstImg = 'assets/images/clouterImage.jpg';
// }

class ClouterList extends GetView<InfiniteScrollController> {
  ClouterList({super.key});

  var clouterId = Get.arguments;

  Clouter clouter = Clouter();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final infiniteController = Get.put(InfiniteScrollController());
    infiniteController.toggleData(true);
    return GetBuilder<InfiniteScrollController>(
        builder: (controller) => Scaffold(
            drawer: MyDrawer(),
            backgroundColor:
                style.colors['white'], // 기본 backgroundColor 밝은 회색이길래 넣은 코드
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
                  ClouterInfiniteScrollBody(),
                  SizedBox(height: 30),
                ],
              ),
            )));
  }
}
