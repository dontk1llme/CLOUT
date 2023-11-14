import 'package:clout/hooks/apis/authorized_api.dart';
import 'package:clout/utilities/category_translator.dart';
import 'package:clout/widgets/sns/sns2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// api
import 'dart:convert';
import 'dart:async';
import 'package:clout/type.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';

// widgets
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
  // 그니까 내가 원하는건 파라미터가 새로 갱신되는게 아니라 뒤에 덧붙여졌으면 좋겠음 ㅜ 먼말인지 아는데
  // 나도 이 플로우를 알아야 어디서 그걸 끼워넣을지를 판단을 해서 한번 보는 중이얌

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

    int offset = data.length;

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
