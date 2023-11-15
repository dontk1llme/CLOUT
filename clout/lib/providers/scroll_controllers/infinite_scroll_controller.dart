import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  setIsLoading(input) {
    isLoading = input;
    update();
  }

  Timer _timer = Timer(Duration(milliseconds: 3000), () {});

  @override
  void onInit() {
    scrollController.value.addListener(() {
      print(scrollController.value.position.pixels);
      // print(scrollController.value.position.minScrollExtent);
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore) {
        setCurrentPage(currentPage + 1);
      }
      if (scrollController.value.position.pixels < -200) {
        if (!_timer.isActive) {
          HapticFeedback.mediumImpact();
          setCurrentPage(0);
          reload();
          // isLoading = true;
          _timer = Timer(Duration(milliseconds: 3000), () {});
        }
      }
    });

    super.onInit();
  }

  getData() async {
    isLoading = true;
    // hasMore = true;
    print('여기까지 옴1');
    await Future.delayed(Duration(seconds: 2));
    print('여기까지 옴2');
    final AuthorizedApi authorizedApi = AuthorizedApi();
    var response = await authorizedApi.getRequest(endPoint, parameter);
    print(response);
    var jsonData = jsonDecode(response['body']);
    var contentList = jsonData['content'] as List;

    var appendData = [];

    if (contentList.isNotEmpty) {
      print('여기까지 옴3');
      for (var item in contentList) {
        print('여기까지 옴4');

        if (item.containsKey('applyId')) {
          var campaignData = ApplyContent.fromJson(item);
          // var imageList = item['imageList'];
          print('🌟 계약으로 오나..?');

          var campaignItemBox = Padding(
            padding: const EdgeInsets.all(10.0),
            child: CampaignItemBox(
              applyId: campaignData.applyId ?? 0,
              campaignId: campaignData.campaignId ?? 0,
              adCategory: AdCategoryTranslator.translateAdCategory(
                  campaignData.adCategory!),
              title: campaignData.title ?? "제목없음",
              price: campaignData.price ?? 0,
              companyName: campaignData.companyName!,
              numberOfSelectedMembers:
                  campaignData.numberOfSelectedMembers ?? 0,
              numberOfRecruiter: campaignData.numberOfRecruiter ?? 0,
              // firstImg: ImageResponse.fromJson(imageList[0]).path,
              advertiserAvgStar: campaignData.advertiserAvgStar ?? 0,
              adPlatformList: campaignData.adPlatformList
                      ?.map((platform) => Sns2(platform: platform))
                      .toList() ??
                  [],
            ),
          );
          appendData.add(campaignItemBox);
        } else {
          var campaignData = CampaignInfo.fromJson(item['campaign']);
          var advertiserData = AdvertiserInfo.fromJson(item['advertiserInfo']);
          var imageList = item['imageList'];
          print('❌ 캠페인으로 가나..?');
          var campaignItemBox = Padding(
            padding: const EdgeInsets.all(10.0),
            child: CampaignItemBox(
              campaignId: campaignData.campaignId ?? 0,
              adCategory: AdCategoryTranslator.translateAdCategory(
                  campaignData.adCategory!),
              title: campaignData.title ?? "제목없음",
              price: campaignData.price ?? 0,
              companyInfo: advertiserData.companyInfo!,
              numberOfSelectedMembers:
                  campaignData.numberOfSelectedMembers ?? 0,
              numberOfRecruiter: campaignData.numberOfRecruiter ?? 0,
              firstImg: ImageResponse.fromJson(imageList[0]).path,
              adPlatformList: campaignData.adPlatformList
                      ?.map((platform) => Sns2(platform: platform))
                      .toList() ??
                  [],
              advertiserInfo: advertiserData,
            ),
          );
          appendData.add(campaignItemBox);
        }
      }
      data.addAll(appendData);

      isLoading = false;
      hasMore = contentList.isNotEmpty;
      update();
    } else {
      isLoading = false;
      hasMore = false;
      update();
    }
  }

  reload() async {
    setIsLoading(true);
    data.clear();
    setCurrentPage(0);
    // await Future.delayed(Duration(seconds: 2));

    await getData();
    update();
  }
}
