import 'dart:convert';
import 'dart:async';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Clouter {
  int clouterId = 1;
  String nickname = '모카우유';
  int starRating = 20;
  int fee = 500000;
  String category = '반려동물';
  int contractCount = 5;
  List<String> selectedPlatform = [
    "YOUTUBE",
    "INSTAGRAM",
    "TIKTOK",
  ];
  String firstImg = 'assets/images/clouterImage.jpg';
}

String baseUrl = dotenv.env['CLOUT_APP_BASE_URL']!;

// Future<Campaign> fetchCampaign(String endPoint, String parameter) async {
//   final response =
//       await http.get(Uri.parse('${baseUrl}/v1/${endPoint}${parameter}'));

//   if (response.statusCode == 200) {
//     print('👻✨ response body: ${response.body}');
//     return Campaign.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('캠페인 불러오기 실패 💨');
//   }
// }

class InfiniteScrollController extends GetxController {
  getRequest(endPoint, parameter) async {
    var url = Uri.parse('${baseUrl}${endPoint}${parameter}');
    print('3️⃣');
    print('${url} 👉 infinite_scroll_controller.dart');
    print('${json.encode(parameter)} 👉 infinite_scroll_controller.dart');
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    print('4️⃣');
    print('응답코드 입니다. ${response.statusCode}');
    print('reponseBody입니다 ${utf8.decode(response.bodyBytes)}');
    if (response.statusCode == 200) {
      print(
          '👻✨ response body: ${response.body} // 👉 infinite_scroll_controller.dart');
      return utf8.decode(response.bodyBytes);
    } else {
      return null;
    }
  }

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
        '?advertiserId=${userController.userId}&page=${currentPage}&size=${10}';
    update();
  }

  // late Future<Campaign> futureCampaign;

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

    var response = await getRequest(endPoint, parameter);
    print(response);
    var newList = CampaignList.fromJson(jsonDecode(response)).campaignList;
    var advertiser = CampaignList.fromJson(jsonDecode(response)).advertiserInfo;

    if (newList.isNotEmpty) {
      var campaignData = CampaignInfo.fromJson(json.decode(response));
      print('5️⃣');
      print(CampaignList.fromJson(jsonDecode(response)).campaignList);
      print(CampaignList.fromJson(jsonDecode(response))
          .advertiserInfo
          .companyInfo
          .toString());

      var appendData = [];
      for (int i = 0; i < newList.length; i++) {
        var campaignItemBox = Padding(
          padding: const EdgeInsets.all(10.0),
          child: CampaignItemBox(
            campaignId: newList[i]['campaignId'],
            adCategory: newList[i]['adCategory'] ?? "",
            title: newList[i]['title'] ?? "제목없음",
            price: newList[i]['price'] ?? 0,
            companyInfo: advertiser.companyInfo!,
            numberOfSelectedMembers: newList[i]['numberOfSelectedMembers'] ?? 0,
            numberOfRecruiter: newList[i]['numberOfRecruiter'] ?? 0,
            adPlatformList: newList[i]['adPlatformList'] ?? [],
            advertiserInfo: advertiser,
            // firstImg: 'images/assets/itemImage.jpg', // 💥 이미지 수정하기
          ),
        );
        appendData.add(campaignItemBox);
      }
      // var appendData = isClouterData
      //     ? List<Clouter>.generate(10, (i) {
      //         var clouter = Clouter();
      //         clouter.clouterId = i + 1 + offset;
      //         return clouter;
      //       })
      //     : [campaignItemBox];
      data.addAll(appendData);

      isLoading = false;
      // hasMore = data.length < 30;
      hasMore = newList.isNotEmpty;
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
