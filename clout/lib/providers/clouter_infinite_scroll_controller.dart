import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Clouter {
  int clouterId = 1;
  String nickname = '모카우유';
  int starRating = 20;
  int fee = 500000;
  String category = '반려동물';
  int contractCount = 5;
  List<String> selectedPlatform = [
    "YouTube",
    "Instagram",
    "TikTok",
  ];
  String firstImg = 'assets/images/clouterImage.jpg';
}

class ClouterInfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;

  Clouter clouter = Clouter();
  int pageSize = 20;
  // List<Campaign> data = [campaign];
  // List data = <int>[].obs;
  List<Clouter> data = <Clouter>[].obs;

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
    var appendData = List<Clouter>.generate(10, (i) {
      var clouter = Clouter();
      clouter.clouterId = i + 1 + offset;
      return clouter;
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
