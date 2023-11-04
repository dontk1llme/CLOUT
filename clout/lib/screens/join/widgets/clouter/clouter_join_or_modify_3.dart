import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/image_pickder/image_widget.dart';
import 'package:clout/widgets/platform_toggle_input/platform_toggle_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/widgets/input/input.dart';
import 'package:clout/widgets/sns/platform_toggle.dart';
import 'package:clout/screens/join/widgets/clouter/followersDropdown.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ClouterJoinOrModify3 extends StatefulWidget {
  const ClouterJoinOrModify3({super.key, required this.modifying, required this.controllerTag});
  final modifying;
  final controllerTag;

  @override
  ClouterJoinOrModify3State createState() => ClouterJoinOrModify3State();
}

class ClouterJoinOrModify3State extends State<ClouterJoinOrModify3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '3. SNS 정보',
                  style: style.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 10),
              PlatformToggle(
                multiAllowed: false,
                controllerTag: widget.controllerTag,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        PlatformToggleInput(),
      ],
    );
  }
}
