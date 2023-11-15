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
import 'package:clout/widgets/list/campaign_item_box.dart';

class InfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;

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
        '?advertiserId=${userController.memberId}&page=${currentPage}&size=${10}';
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
    var response = await authorizedApi.getRequest(endPoint, parameter);
    print(response);
    var jsonData = jsonDecode(response['body']);
    var contentList = jsonData['content'] as List;

    var appendData = [];

    if (contentList.isNotEmpty) {
      for (var item in contentList) {
        var campaignData = CampaignInfo.fromJson(item['campaign']);
        var advertiserData = AdvertiserInfo.fromJson(item['advertiserInfo']);

        var campaignItemBox = Padding(
          padding: const EdgeInsets.all(10.0),
          child: CampaignItemBox(
            campaignId: campaignData.campaignId ?? 0,
            adCategory: AdCategoryTranslator.translateAdCategory(
                campaignData.adCategory!),
            title: campaignData.title ?? "제목없음",
            price: campaignData.price ?? 0,
            companyInfo: advertiserData.companyInfo!,
            numberOfSelectedMembers: campaignData.numberOfSelectedMembers ?? 0,
            numberOfRecruiter: campaignData.numberOfRecruiter ?? 0,
            adPlatformList: campaignData.adPlatformList
                    ?.map((platform) => Sns2(platform: platform))
                    .toList() ??
                [],
            advertiserInfo: advertiserData,
            // firstImg: 'images/assets/itemImage.jpg', // 💥 이미지 수정하기
          ),
        );
        appendData.add(campaignItemBox);
      }
      data.addAll(appendData);

      isLoading = false;
      hasMore = contentList.isNotEmpty;
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
}
