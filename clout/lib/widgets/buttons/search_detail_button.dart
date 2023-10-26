import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/screens/campaign_register/widgets/minimumfollowers_dialog.dart';
import 'package:clout/widgets/sns/sns3.dart';
import 'package:clout/screens/campaign_register/widgets/age_slider.dart';
import 'package:clout/screens/campaign_register/widgets/region_multiselect.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/widgets/input/input.dart';

// Screens
import 'package:clout/widgets/list/data_title_thin.dart';

class SearchDetailButton extends StatefulWidget {
  SearchDetailButton({super.key, this.setAge, this.ageRanges});
  var setAge;
  var ageRanges;

  @override
  State<SearchDetailButton> createState() => _SearchDetailButtonState();
}

class _SearchDetailButtonState extends State<SearchDetailButton> {
  var maxFee;
  var minFee;
  var minimumFollowers;
  var minimumFollowersString = '0';
  var selectedRegions = [];

  setMaxFee(input) {
    setState(() {
      maxFee = input;
    });
  }

  setMinFee(input) {
    setState(() {
      minFee = input;
    });
  }

  setSelectedRegions(input) {
    setState(() {
      selectedRegions = input;
    });
  }

  setMinimumFollowers(input) {
    setState(() {
      minimumFollowers = input;
    });
  }

  setMinimumFollowersString(input) {
    setState(() {
      minimumFollowersString = input;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  // child: Center(
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
                          ]),
                      DataTitleThin(text: '희망 광고 플랫폼', pdtop: 20),
                      Sns3(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('다중 선택 가능',
                            style: TextStyle(color: style.colors['gray'])),
                      ),
                      DataTitleThin(text: '희망 클라우터 나이', pdtop: 10),
                      // slider 추가
                      AgeSlider(
                          setAge: widget.setAge, ageRanges: widget.ageRanges),
                      // dropdown 추가
                      DataTitleThin(text: '희망 최소 팔로워 수', pdtop: 25),
                      MinimumfollowersDialog(
                          minimumFollowers: minimumFollowers,
                          minimumFollowersString: minimumFollowersString,
                          setMinimumFollowers: setMinimumFollowers,
                          setMinimumFollowersString: setMinimumFollowersString),
                      DataTitleThin(text: '희망 광고비', pdtop: 10),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Input(
                              placeholder: '최소 금액 (만원)',
                              setText: setMinFee,
                            ),
                          ),
                          SizedBox(width: 5),
                          Flexible(
                            flex: 1,
                            child: Input(
                              placeholder: '최대 금액 (만원)',
                              setText: setMaxFee,
                            ),
                          ),
                        ],
                      ),
                      DataTitleThin(text: '지역 선택', pdtop: 20),
                      RegionMultiSelect(
                          selectedRegions: selectedRegions,
                          setSelectedRegions: setSelectedRegions),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: BigButton(
                          title: '검색',
                          destination: '/campaignlist',
                        ),
                      )
                    ],
                    // ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
