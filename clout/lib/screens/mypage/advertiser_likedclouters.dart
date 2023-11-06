import 'package:clout/screens/clouter/clouter_infinite_scroll_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;
// widgets
import 'package:clout/widgets/buttons/filter_button.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';

// controllers
import 'package:clout/providers/scroll_controllers/infinite_scroll_controller.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
    final infiniteController = Get.put(InfiniteScrollController());
    infiniteController.toggleData(true);
    return GetBuilder<InfiniteScrollController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '관심있는 클라우터 목록',
          ),
        ),
        body: ClouterInfiniteScrollBody(),
      ),
    );
  }
}
