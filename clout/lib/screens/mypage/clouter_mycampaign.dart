import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// widgets
import 'package:clout/screens/mypage/widgets/content_text.dart';
import 'package:clout/screens/mypage/widgets/gray_title.dart';
import 'package:clout/screens/mypage/widgets/info_item_box.dart';
import 'package:clout/screens/mypage/widgets/update_button.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';
import 'package:clout/widgets/list/campaign_item_box.dart';

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

class ClouterMyCampaign extends StatefulWidget {
  ClouterMyCampaign({Key? key}) : super(key: key);

  @override
  _ClouterMyCampaignState createState() => _ClouterMyCampaignState();
}

class _ClouterMyCampaignState extends State<ClouterMyCampaign> {
  static const _pageSize = 20;

  // 스크롤 감지하는 컨트롤러
  final PagingController<int, Campaign> _pagingController =
      PagingController(firstPageKey: 0);

  // 컨트롤러에 fetch 함수 추가
  // pageKey는 가져온 데이터 갯수랑 동일
  // 처음에는 api에 0 입력되고, 마지막 페이지가 아니라면 20씩 증가됨
  // @override
  // void initState() {
  //   _pagingController.addPageRequestListener((pageKey) {
  //     _fetchPage(pageKey);
  //   });
  //   super.initState();
  // }

  // appendPage를 이용해서 데이터 추가
  // 마지막 페이지일 경우에는 가져온 데이터의 갯수와 한 페이지에 들어갈 아이템 수 비교
  // aapendLastPage() 함수 이용하여 넣어준다
  // Future<void> _fetchPage(int pageKey) async {
  //   try {
  //     final newItems = await RemoteApi.getCampaignList(pageKey, _pageSize);
  //     final isLastPage = newItems.length < _pageSize;
  //     if (isLastPage) {
  //       _pagingController.appendLastPage(newItems);
  //     } else {
  //       final nextPageKey = pageKey + newItems.length;
  //       _pagingController.appendPage(newItems, nextPageKey.toInt());
  //     }
  //   } catch (error) {
  //     _pagingController.error = error;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '신청한 캠페인',
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
          ),
          // 스크롤 동작에 대한 컨트롤러 PagingController
          // 해당 스크롤 위젯에 그려질 child를 builderDelegate에서 정의
          child: PagedListView<int, Campaign>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Campaign>(
              itemBuilder: (context, item, index) {
                return CampaignItemBox(
                  // campaign: item,
                  category: item.category,
                  productName: item.productName,
                  pay: item.pay,
                  campaignSubject: item.campaignSubject,
                  applicantCount: item.applicantCount,
                  recruitCount: item.recruitCount,
                  selectedPlatform: item.selectedPlatform,
                  starRating: item.starRating,
                  firstImg: item.firstImg,
                );
              },
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
