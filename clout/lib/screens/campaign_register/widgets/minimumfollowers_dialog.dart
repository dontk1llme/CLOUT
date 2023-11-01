import 'package:clout/providers/follower_controller.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/widgets/followercount_input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class MinimumfollowersDialog extends StatelessWidget {
  MinimumfollowersDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FollowerContoller>(
        builder: (controller) => SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: ((context) {
                          return FollowercountInputDialog();
                        })),
                    child: Text(
                      controller.minimumFollowersString,
                      style: style.textTheme.titleMedium?.copyWith(
                          color: style.colors['main1'],
                          fontWeight: FontWeight.bold,
                          height: 1.1),
                    )),
                DataTitle(
                  text: '명',
                )
              ],
            )));
  }
}
