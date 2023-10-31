import 'package:clout/providers/serach_detail_controller.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/search_detail_bottom_sheet/widgets/fee_range_dialog.dart';
import 'package:clout/widgets/search_detail_bottom_sheet/widgets/followercount_state_dialog.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/sns/sns3.dart';
import 'package:clout/screens/campaign_register/widgets/age_slider.dart';
import 'package:clout/screens/campaign_register/widgets/region_multiselect.dart';
import 'package:clout/widgets/buttons/big_button.dart';

// Screens
import 'package:clout/widgets/list/data_title_thin.dart';
import 'package:get/get.dart';

class SearchDetailButton extends StatefulWidget {
  SearchDetailButton({super.key});

  @override
  State<SearchDetailButton> createState() => _SearchDetailButtonState();
}

class _SearchDetailButtonState extends State<SearchDetailButton> {
  void openBottomSheet() {
    final controller = Get.put(SearchDetailController());

    Get.bottomSheet(
        isScrollControlled: true,
        Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(color: Colors.white),
            child: BouncingListview(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('상세 조건 설정',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          )),
                      InkWell(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DataTitleThin(text: '희망 광고 플랫폼'),
                      Text('다중 선택 가능',
                          style: TextStyle(color: style.colors['gray']))
                    ],
                  ),
                  SizedBox(height: 10),
                  Sns3(),
                  ///////////////////////////////////////////
                  SizedBox(height: 20),
                  DataTitleThin(text: '희망 클라우터 나이'),
                  // slider 추가
                  AgeSlider(),
                  ///////////////////////////////////////////
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DataTitleThin(text: '희망 최소 팔로워 수(최대 10억)'),
                      Text('최대 10억',
                          style: TextStyle(color: style.colors['gray']))
                    ],
                  ),
                  FollowercountStateDialog(),
                  ///////////////////////////////////////////
                  DataTitleThin(text: '희망 광고비'),
                  SizedBox(height: 10),
                  FeeRangeDialog(),
                  ///////////////////////////////////////////
                  SizedBox(height: 20),
                  DataTitleThin(text: '지역 선택'),
                  SizedBox(height: 10),
                  RegionMultiSelect(
                    selectedRegions: controller.selectedRegions,
                    setSelectedRegions: controller.setSelectedRegions,
                  ),
                  ///////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: BigButton(
                        title: '검색',
                        destination: '/campaignlist',
                      ),
                    ),
                  )
                ],
                // ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SearchDetailController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // 가장 오른쪽으로 정렬
      children: <Widget>[
        InkWell(
          child: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(children: [
              Text(
                '검색 조건 설정',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: style.colors['main1']),
              ),
              Icon(Icons.chevron_right, size: 20, color: style.colors['main1']),
            ]),
          ),
          onTap: () {
            openBottomSheet();
          },
        ),
      ],
    );
  }
}
