import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/screens/list/widgets/clouter_infinite_scroll_body.dart';
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

class AdvertiserLikedclouters extends StatelessWidget {
  AdvertiserLikedclouters({super.key});
  Clouter clouter = Clouter();
  final infiniteController =
      Get.put(InfiniteScrollController(), tag: 'advertiserLikedClouters');
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    infiniteController.setEndPoint('bookmarks');
    infiniteController.setParameter('?memberId=${userController.userId}');
    infiniteController.toggleData(true);
    return GetBuilder<InfiniteScrollController>(
      tag: 'advertiserLikedClouters',
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '관심있는 클라우터 목록',
          ),
        ),
        body: ClouterInfiniteScrollBody(
          controllerTag: 'advertiserLikedClouters',
        ),
      ),
    );
  }
}
