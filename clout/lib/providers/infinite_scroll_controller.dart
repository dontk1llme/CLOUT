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

class InfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;

  Campaign campaign = Campaign();
  int pageSize = 20;
  // List<Campaign> data = [campaign];
  // List data = <int>[].obs;
  List<Campaign> data = <Campaign>[].obs;

  var isLoading = false;
  var hasMore = false;

  @override
  void onInit() {
    _getData();

    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore) {
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

    // 데이터 몇개씩 보여줄건지? (10개씩 무한스크롤)
    var appendData = List<Campaign>.generate(10, (i) {
      var campaign = Campaign();
      campaign.campaignId = i + 1 + offset;
      return campaign;
    });
    data.addAll(appendData);

    print(data.length);

    isLoading = false;
    hasMore = data.length < 30;
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
