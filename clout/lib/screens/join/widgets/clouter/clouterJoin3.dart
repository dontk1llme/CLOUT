import 'package:clout/providers/image_picker_provider.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/image_widget.dart';
import 'package:clout/widgets/platform_toggle_input/platform_toggle_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/widgets/input/input.dart';
import 'package:clout/widgets/sns/platform_toggle.dart';
import 'package:clout/screens/join/widgets/clouter/followersDropdown.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ClouterJoin3 extends StatefulWidget {
  const ClouterJoin3({super.key});

  @override
  _ClouterJoin3State createState() => _ClouterJoin3State();
}

class _ClouterJoin3State extends State<ClouterJoin3> {
  double percent = 0.66; // 초기값 설정

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
