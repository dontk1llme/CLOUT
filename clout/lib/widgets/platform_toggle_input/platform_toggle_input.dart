import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/widgets/platform_toggle_input/input_customdrop.dart';
import 'package:clout/widgets/sns/platform_toggle.dart';
import 'package:flutter/material.dart'
    hide BoxDecoration, BoxShadow; //  기존 BoxShadow 속성을 가려줘야 함
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class PlatformToggleInput extends StatelessWidget {
  PlatformToggleInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlatformSelectController>(
      builder: (controller) => Stack(
        children: [
          // 인스타그램 입력 창
          InputCustomdrop(index: 0),
          // 틱톡 입력 창
          InputCustomdrop(index: 1),
          // 유튜브 입력 창
          InputCustomdrop(index: 2),
        ],
      ),
    );
  }
}
