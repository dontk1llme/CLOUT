import 'package:clout/providers/clouter_register_controller.dart';
import 'package:clout/screens/campaign_register/widgets/pay_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/widgets/input/input.dart';
import 'package:clout/screens/join/widgets/clouter/categoryToggle.dart';
import 'package:clout/screens/campaign_register/widgets/region_multiselect.dart';

class ClouterJoin4 extends StatefulWidget {
  ClouterJoin4({Key? key}) : super(key: key);

  @override
  ClouterJoin4State createState() => ClouterJoin4State();
}

class ClouterJoin4State extends State<ClouterJoin4> {
  double percent = 1; // 초기값 설정

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClouterRegisterController>(
      builder: (controller) => FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              '3. 희망 광고 정보',
              style: style.textTheme.titleSmall,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '희망 광고비\n(최소 금액)',
                  style: style.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w500, height: 1.2),
                  textAlign: TextAlign.left,
                ),
                PayDialog(
                  title: '희망 광고비',
                  hintText: '희망 광고비 입력',
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '희망 카테고리',
              style: style.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w500, height: 1.2),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            CategoryToggle(),
            SizedBox(height: 20),
            Text(
              '희망 지역',
              style: style.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w500, height: 1.2),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            RegionMultiSelect(),
            SizedBox(height: 8), //
            // RegionDropdown(region: region, setRegion: setRegion)
          ],
        ),
      ),
    );
  }
}
