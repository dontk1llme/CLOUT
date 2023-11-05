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
                            child: ClouterItemBox(
                              nickname: controller.data[index].nickname,
                              starRating: controller.data[index].starRating,
                              fee: controller.data[index].fee,
                              category: controller.data[index].category,
                              contractCount:
                                  controller.data[index].contractCount,
                              selectedPlatform:
                                  controller.data[index].selectedPlatform,
                              firstImg: controller.data[index].firstImg,
                            ));
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
            )));
  }
}
