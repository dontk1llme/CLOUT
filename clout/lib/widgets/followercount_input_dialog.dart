// Global
import 'package:clout/providers/follower_controller.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// Widgets
import 'package:clout/widgets/input/input_elements/utilities/numeric_range_formatter.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FollowercountInputDialog extends StatelessWidget {
  FollowercountInputDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FollowerContoller(), permanent: true);
    return GetBuilder<FollowerContoller>(
        builder: (controller) => AlertDialog(
              title: Text("모집인원"),
              content: StatefulBuilder(builder: (context, setState) {
                return SizedBox(
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
                                contentPadding:
                                    EdgeInsets.only(left: 15, right: 15),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: style.colors['main1']!,
                                        width: 2))),
                            initialValue: controller.minimumFollowers,
                            onChanged: (newVal) {},
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
                        ]));
              }),
              actions: <Widget>[
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: style.colors['main1']),
                    child: Text("확인"),
                  ),
                ),
              ],
            ));
  }
}
