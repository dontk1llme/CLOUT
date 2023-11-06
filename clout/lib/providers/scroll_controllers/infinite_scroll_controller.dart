import 'dart:convert';
import 'dart:async';
import 'package:clout/type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:loading_indicator/loading_indicator.dart';

Future<Campaign> fetchCampaign(String endpoint) async {
  final response = await http
      .get(Uri.parse('http://70.12.247.35:8889/v1/advertisements/$endpoint'));

  if (response.statusCode == 200) {
    print('👻✨ response body: ${response.body}');
    return Campaign.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('캠페인 불러오기 실패 💨');
  }
}


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

class InfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;

  var isClouterData = true; // 클라우터 정보인지 아닌지
  List<dynamic> data = [].obs;

  int pageSize = 20;
  var isLoading = false;
  var hasMore = false;

  late Future<Campaign> futureCampaign;

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

    var campaignItemBox = FutureBuilder<Campaign>(
      future: futureCampaign,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CampaignItemBox(
            category: snapshot.data!.adCategory,
            productName: snapshot.data!.title,
            pay: snapshot.data!.price,
            campaignSubject: snapshot.data!.companyName,
            applicantCount: snapshot.data!.numberOfSelectedMembers,
            recruitCount: snapshot.data!.numberOfRecruiter,
            selectedPlatform: snapshot.data!.adPlatformList,
            starRating: snapshot.data!.advertiserAvgstar,
            firstImg: 'images/assets/itemImage.jpg', // 💥 이미지 수정하기
          );
        } else if (snapshot.hasError) {
          return Text('⛔ Campaign item error: ${snapshot.error}');
        }
        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          child: SizedBox(
            height: 50,
            child: Center(
                child: LoadingIndicator(
              indicatorType: Indicator.ballRotateChase,
              colors: [
                style.colors['main1-4']!,
                style.colors['main1-3']!,
                style.colors['main1-2']!,
                style.colors['main1-1']!,
                style.colors['main1']!,
              ],
            )),
          ),
        );
      },
    );

    // 데이터 몇개씩 보여줄건지? (10개씩 무한스크롤)
    var appendData = isClouterData
        ? List<Clouter>.generate(10, (i) {
            var clouter = Clouter();
            clouter.clouterId = i + 1 + offset;
            return clouter;
          })
        : [campaignItemBox];
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

  toggleData(input) {
    isClouterData = input;
    data = [];
    _getData();
    update();
  }
}
