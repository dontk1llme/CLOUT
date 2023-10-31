// Global
import 'package:clout/providers/serach_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// Widgets
import 'package:clout/widgets/input/input_elements/utilities/numeric_range_formatter.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//이건 getX 쓸때 쓰는 컴포넌트임 일반으로 쓰는 컴포넌트는 followercount_input_dialog.dart
class FollowercountStateDialog extends StatelessWidget {
  FollowercountStateDialog({super.key});

  void openDialog() {
    Get.defaultDialog(
      title: "모집인원",
      titlePadding: EdgeInsets.fromLTRB(0, 20, 0, 10),
      contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      content: GetBuilder<SearchDetailController>(
          builder: (controller) => SizedBox(
              height: 75,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      inputFormatters: [
                        NumericRangeFormatter(min: 0, max: 1000000000),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: '희망 최소 팔로워수(최대 10억)',
                          contentPadding: EdgeInsets.only(left: 15, right: 15),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: style.colors['main1']!, width: 2))),
                      initialValue: controller.minimumFollowers,
                      onChanged: (newVal) {
                        controller.setMinimumFollowers(newVal);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(controller.minimumFollowersString),
                        DataTitle(
                          text: '명',
                        )
                      ],
                    )
                  ]))),
      actions: <Widget>[
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.back(),
            style: ElevatedButton.styleFrom(
                backgroundColor: style.colors['main1']),
            child: Text("확인"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchDetailController>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => openDialog(),
                    child: Text(
                      controller.minimumFollowersString,
                      style: style.textTheme.titleSmall?.copyWith(
                          color: style.colors['main1'],
                          fontWeight: FontWeight.bold,
                          height: 1.1),
                    )),
                DataTitle(
                  text: '명',
                )
              ],
            ));
  }
}
