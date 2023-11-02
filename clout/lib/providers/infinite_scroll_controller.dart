import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Campaign {
  int campaignId = 1;
  String category = '음식';
  String productName = '못골정미소 백미 5kg';
  int pay = 1000;
  String campaignSubject = '못골영농조합법인';
  int applicantCount = 2;
  int recruitCount = 5;
  List<String> selectedPlatform = [
    "YouTube",
    // "Instagram",
    "TikTok",
  ];
  int starRating = 20;
  String firstImg = 'assets/images/itemImage.jpg';
}

Campaign campaign = Campaign();

class InfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;

  int pageSize = 20;
  List<Campaign> data = [campaign];
  var isLoading = false;
  var hasMore = false;

  @override
  void onInit() {
    _getData();

    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
          scrollController.value.position.maxScrollExtent) {
        _getData();
      }
    });

    super.onInit();
  }

  _getData() async {
    isLoading = true;

    await Future.delayed(Duration(seconds: 2));

    int offset = data.length;
    // 캠페인 추가하는 통신(아니면 다른 정3보) 여기에 작성해야될듯
    var appendData = List<Campaign>.generate(20, (i) {
      return Campaign()
        ..campaignId = i + 1 + offset
        ..category = '음식'
        ..productName = '못골정미소 백미 5kg'
        ..pay = 1000
        ..campaignSubject = '못골영농조합법인'
        ..applicantCount = 2
        ..recruitCount = 5
        ..selectedPlatform = [
          "YouTube",
          // "Instagram",
          "TikTok",
        ]
        ..starRating = 20
        ..firstImg = 'assets/images/itemImage.jpg';
    });
    data.addAll(appendData);

    print(data.length);

    isLoading = false;
    hasMore = data.length < 20;
    update();
  }

  reload() async {
    isLoading = true;
    data.clear();

    await Future.delayed(Duration(seconds: 2));

    _getData();
    update();
  }
}
