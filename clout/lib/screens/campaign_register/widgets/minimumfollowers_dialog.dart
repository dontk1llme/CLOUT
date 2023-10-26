import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/widgets/followercount_input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class MinimumfollowersDialog extends StatelessWidget {
  MinimumfollowersDialog({
    super.key,
    this.minimumFollowers,
    this.setMinimumFollowers,
    this.minimumFollowersString,
    this.setMinimumFollowersString,
  });
  final minimumFollowers;
  final setMinimumFollowers;
  final minimumFollowersString;
  final setMinimumFollowersString;

  numbering(value, division) {
    return (value / division).floor();
  }

  converter(input) {
    if (input.length > 1) {
      int number = int.parse(input);
      var numbers = [
        numbering(number, 100000000),
        numbering(number % 100000000, 10000),
        numbering(number % 10000, 1000),
        numbering(number % 1000, 1)
      ];
      var result = '';
      var unit = ["억", '만', '천', ''];
      for (var i = 0; i < numbers.length; i++) {
        if (numbers[i] >= 1) {
          result += '${numbers[i]}${unit[i]} ';
        }
      }
      return result;
    } else {
      return input;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: ((context) {
                      return FollowercountInputDialog(
                        value: minimumFollowers,
                        setData: setMinimumFollowers,
                        setValueString: setMinimumFollowersString,
                        valueString: minimumFollowersString,
                        converter: converter,
                      );
                    })),
                child: Text(
                  minimumFollowersString,
                  style: style.textTheme.titleMedium?.copyWith(
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
