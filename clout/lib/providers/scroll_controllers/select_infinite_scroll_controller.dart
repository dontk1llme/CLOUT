import 'package:clout/widgets/sns/sns4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// api
import 'dart:convert';
import 'dart:async';
import 'package:clout/type.dart';
import 'package:clout/hooks/apis/authorized_api.dart';

// controllers
import 'package:clout/providers/user_controllers/user_controller.dart';

// widgets
import 'package:clout/screens/clouter_select/widgets/select_item_box.dart';

class SelectInfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;

  List<dynamic> data = [].obs;

  int pageSize = 20;
  var isLoading = false;
  var hasMore = true;
  var currentPage = 0;
  var endPoint = '';
  var parameter = '';
  var campaignId = Get.arguments;

  setEndPoint(input) {
    endPoint = input;
    update();
  }

  setParameter(input) {
    parameter = input;
    update();
  }

  setCurrentPage(input) {
    currentPage = input;
    parameter = '?advertisementId=$campaignId&page=$currentPage&size=${10}';
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
    print(parameter);
    var response = await authorizedApi.getRequest(
        '/advertisement-service/v1/applies/advertisers?', parameter);

    var jsonData = jsonDecode(response['body']);
    var contentList = jsonData['content'] as List;

    var appendData = [];

    if (contentList.isNotEmpty) {
      for (var item in contentList) {
        var clouterInfo = AppliedClouterInfo.fromJson(item);

        var selectItemBox = Padding(
          padding: EdgeInsets.all(5),
          child: SelectItemBox(
            clouterId: clouterInfo.campaignId,
            fee: clouterInfo.hopeAdFee,
            nickName: clouterInfo.nickname,
            starRating: clouterInfo.clouterAvgStar,
            // selectedPlatform: clouterInfo.clouterChannelList
            //         ?.map((channel) => Sns4(selectedPlatform: channel.platform))
            //         .toList() ??
            //     [],
          ),
        );
        appendData.add(selectItemBox);
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
