import 'package:clout/providers/fee_controller.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/widgets/input/input_elements/utilities/numeric_range_formatter.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PayDialog extends StatelessWidget {
  PayDialog({super.key});

  openPayDialog() {
    Get.defaultDialog(
      title: "희망 광고비",
      content: GetBuilder<FeeController>(
        builder: (controller) => SizedBox(
          height: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                inputFormatters: [
                  NumericRangeFormatter(min: 0, max: 1000000000),
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: '희망 광고비 입력',
                    contentPadding: EdgeInsets.only(left: 15, right: 15),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: style.colors['main1']!, width: 2))),
                initialValue: controller.pay,
                onChanged: (newVal) {
                  controller.setPay(newVal);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(controller.payString),
                ],
              )
            ],
          ),
        ),
      ),
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
    return GetBuilder<FeeController>(
      builder: (controller) => SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => openPayDialog(),
              child: Text(
                controller.payString,
                style: style.textTheme.titleMedium?.copyWith(
                    color: style.colors['main1'],
                    fontWeight: FontWeight.bold,
                    height: 1.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
