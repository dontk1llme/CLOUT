import 'package:flutter/material.dart';
import 'package:get/get.dart';

// api
import 'dart:convert';
import 'dart:async';
import 'package:clout/type.dart';
import 'package:clout/hooks/apis/authorized_api.dart';

// utilities
import 'package:clout/utilities/category_translator.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';

// widgets
import 'package:clout/widgets/sns/sns2.dart';
import 'package:clout/widgets/list/clouter_item_box.dart';

class ClouterInfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;

  var isClouterData = true; // 클라우터 정보인지 아닌지
  List<dynamic> data = [].obs;

  int pageSize = 20;
  var isLoading = false;
  var hasMore = true;
  var currentPage = 0;
  var endPoint = '';
  var parameter = '';

  setEndPoint(input) {
    endPoint = input;
    update();
  }

  setParameter(input) {
    parameter = input;
    update();
  }

  setCurrentPage(input) {
    final userController = Get.find<UserController>();
    currentPage = input;
    parameter =
        // '?advertiserId=${userController.memberId}&page=${currentPage}&size=${10}';
        '?advertiserId=${userController.memberId}';
    update();
  }

  @override
  void onInit() {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore) {
        setCurrentPage(currentPage + 1);
        _getData();
      }
    });

    super.onInit();
  }

  _getData() async {
    isLoading = true;
    hasMore = true;

    await Future.delayed(Duration(seconds: 2));

    final AuthorizedApi authorizedApi = AuthorizedApi();

    var response = authorizedApi.getRequest(endPoint, parameter);

    var jsonData = jsonDecode(response);
    var clouterList = jsonData['clouterList'] as List;

    var appendData = [];

    List<String> allPlatforms = ["INSTAGRAM", "TIKTOK", "YOUTUBE"];

    if (clouterList.isNotEmpty) {
      for (var item in clouterList) {
        var clouterInfo = ClouterInfo.fromJson(item);

        var adPlatformWidgets;
        if (clouterInfo.categoryList?.contains("ALL") ?? false) {
          // "ALL"이 포함되어 있으면 모든 플랫폼을 나타내는 Widget 리스트 생성
          adPlatformWidgets =
              allPlatforms.map((platform) => Sns2(platform: platform)).toList();
        } else {
          // 그렇지 않으면, adPlatformList에 있는 플랫폼에 대한 Widget 리스트를 생성
          adPlatformWidgets = clouterInfo.categoryList
              ?.map((platform) => Sns2(platform: platform))
              .toList();
        }

        var clouterItemBox = Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClouterItemBox(
            clouterId: clouterInfo.clouterId!,
            userId: clouterInfo.userId!,
            nickName: clouterInfo.nickName!,
            avgScore: clouterInfo.avgScore ?? 0,
            minCost: clouterInfo.minCost ?? 0,
            categoryList: clouterInfo.categoryList != null
                ? clouterInfo.categoryList!
                    .map(AdCategoryTranslator.translateAdCategory)
                    .toList()
                : ["분류 없음"],
            adPlatformList: adPlatformWidgets,
            // firstImg: 'images/assets/itemImage.jpg', // 💥 이미지 수정하기
          ),
        );
        appendData.add(clouterItemBox);
      }
      data.addAll(appendData);

      isLoading = false;
      hasMore = clouterList.isNotEmpty;
      update();
    } else {
      hasMore = false;
      isLoading = false;
      update();
    }
  }

  reload() async {
    isLoading = true;
    data.clear();

    await Future.delayed(Duration(seconds: 2));

    _getData();
    update();
  }

  toggleData(input) {
    isClouterData = input;
    data = [];
    _getData();
    update();
  }
}
