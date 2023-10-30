import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

class SmallButton extends StatelessWidget {
  SmallButton(
      {super.key,
      this.title,
      this.destination,
      this.function,
      this.notJustRoute});

  final title;
  final destination;
  final function;
  // 단순 페이지 이동이 아니라 조건(로그인, 검색 조건 설정같은 것이 붙을 경우)
  final notJustRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
        width: double.infinity,
        height: 38,
        child: ElevatedButton(
            // null Check
            onPressed: () => {
                  if (destination != null)
                    {
                      if (notJustRoute != null && notJustRoute)
                        {function(destination)}
                      else
                        {Get.toNamed(destination)}
                    }
                  else
                    {
                      function(),
                    }
                },
            style: ElevatedButton.styleFrom(
                backgroundColor: style.colors['main1'],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              title,
              style: style.textTheme.bodyLarge?.copyWith(
                  color: style.colors['white'],
                  fontWeight: FontWeight.w400,
                  height: 1.2),
            )),
      ),
    );
  }
}
