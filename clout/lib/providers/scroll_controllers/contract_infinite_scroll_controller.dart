import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Contract {
  int contractId = 1;
  String name = '못골영농조합법인';
  String pay = '1,000 포인트'; // 포인트 또는 제공물품
}

class ContractInfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;

  Contract clouter = Contract();
  int pageSize = 20;
  List<Contract> data = <Contract>[].obs;

  var isLoading = false;
  var hasMore = false;

  @override
  void onInit() {
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
    var appendData = List<Contract>.generate(10, (i) {
      var contract = Contract();
      contract.contractId = i + 1 + offset;
      return contract;
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
