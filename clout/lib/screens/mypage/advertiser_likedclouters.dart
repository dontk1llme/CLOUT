import 'package:flutter/material.dart';
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/buttons/filter_button.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';

// controllers
import 'package:clout/providers/infinite_scroll_controller.dart';

class Clouter {
  int clouterId = 1;
  String nickname = '모카우유';
  int starRating = 20;
  int fee = 500000;
  String category = '반려동물'; // 카테고리는 대표 1개만 받읍시다..
  int contractCount = 5;
  List<String> selectedPlatform = [
    "YouTube",
    "Instagram",
    "TikTok",
  ];
  String firstImg = 'assets/images/clouterImage.jpg';
}

class AdvertiserLikedclouters extends StatelessWidget {
  AdvertiserLikedclouters({super.key});
  Clouter clouter = Clouter();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final infiniteController = Get.put(InfiniteScrollController());
    infiniteController.toggleData(true);
    return GetBuilder<InfiniteScrollController>(
        builder: (controller) => Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: Header(
                  header: 4,
                  headerTitle: '관심있는 클라우터 목록',
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                // FilterButton(),
                child: Obx(
                  () => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenWidth > 600 ? 4 : 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: screenWidth > 400 ? 15 : 10,
                    ),
                    controller: controller.scrollController.value,
                    itemBuilder: (_, index) {
                      print(controller.hasMore);
                      print(controller.data);
                      print(controller.data.length);
                      if (index < controller.data.length) {
                        return ClouterItemBox(
                          nickname: controller.data[index].nickname,
                          starRating: controller.data[index].starRating,
                          fee: controller.data[index].fee,
                          category: controller.data[index].category,
                          contractCount: controller.data[index].contractCount,
                          selectedPlatform:
                              controller.data[index].selectedPlatform,
                          firstImg: controller.data[index].firstImg,
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
                ),
              ),
            ));
  }
}
