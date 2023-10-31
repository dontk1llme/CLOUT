import 'package:clout/providers/serach_detail_controller.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/widgets/input/input_elements/utilities/numeric_range_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

class FeeRangeDialog extends StatelessWidget {
  FeeRangeDialog({super.key});

  void openDialog() {
    final controller = Get.put(SearchDetailController());

    TextEditingController minController =
        TextEditingController(text: controller.minFee);
    TextEditingController maxController =
        TextEditingController(text: controller.maxFee);

    Get.defaultDialog(
        title: '희망 광고비 범위',
        titlePadding: EdgeInsets.only(top: 30),
        content: GetBuilder<SearchDetailController>(
            builder: (controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Row(children: [
                        Expanded(flex: 1, child: Text('최소')),
                        Expanded(
                            flex: 4,
                            child: TextFormField(
                              controller: minController,
                              inputFormatters: [
                                NumericRangeFormatter(min: 0, max: 1000000000),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              onChanged: (value) => {
                                controller.setMinFee(value),
                              },
                              decoration: InputDecoration(
                                focusColor: style.colors['main1'],
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: style.colors['main1']!,
                                        width: 2)),
                                suffixIcon: IconButton(
                                  onPressed: minController.clear,
                                  icon: Icon(Icons.clear),
                                  color: Colors.grey,
                                ),
                              ),
                            ))
                      ]),
                      Row(children: [
                        Expanded(flex: 1, child: Text('최대')),
                        Expanded(
                            flex: 4,
                            child: TextFormField(
                              controller: maxController,
                              inputFormatters: [
                                NumericRangeFormatter(min: 0, max: 1000000000),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              onChanged: (value) => {
                                controller.setMaxFee(value),
                              },
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: style.colors['main1']!,
                                          width: 2)),
                                  suffixIcon: IconButton(
                                    onPressed: maxController.clear,
                                    icon: Icon(Icons.clear),
                                    color: Colors.grey,
                                  )),
                            ))
                      ]),
                      SizedBox(height: 20),
                      Wrap(
                        children: [
                          Text(
                            controller.minFeeString,
                            style: style.textTheme.bodyLarge?.copyWith(
                                color: style.colors['main1'],
                                fontWeight: FontWeight.w600),
                          ),
                          Text(' ~ '),
                          Text(
                            controller.maxFeeString,
                            style: style.textTheme.bodyLarge?.copyWith(
                                color: style.colors['main1'],
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ]),
                    SizedBox(height: 30),
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: BigButton(
                          title: '확인',
                          function: () => {
                            if (controller.maxFee == null)
                              {
                                controller.setMaxFee('1000000000'),
                              },
                            if (controller.minFee == null)
                              {controller.setMinFee('0')},
                            if (int.parse(controller.minFee) >
                                int.parse(controller.maxFee))
                              {
                                if (controller.maxFee == '0')
                                  {controller.setMaxFee(controller.minFee)}
                                else
                                  {controller.setMinFee(controller.maxFee)},
                                Fluttertoast.showToast(
                                    msg: '범위가 올바르지 않아 조정되었습니다.')
                              },
                            Get.back()
                          },
                        ))
                  ],
                )),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 10),
        radius: 10);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return GetBuilder<SearchDetailController>(
        builder: (controller) => OutlinedButton(
            onPressed: () => openDialog(),
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.all(15),
                side: BorderSide(color: Colors.grey)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(controller.minFeeString,
                  style: style.textTheme.headlineSmall?.copyWith(
                      color: style.colors['main1'],
                      fontWeight: FontWeight.w600,
                      height: 1.2)),
              Text(
                ' ~ ',
                style: TextStyle(color: style.colors['text'], height: 1.2),
              ),
              Text(controller.maxFeeString,
                  style: style.textTheme.headlineSmall?.copyWith(
                      color: style.colors['main1'],
                      fontWeight: FontWeight.w600,
                      height: 1.2)),
            ])));
  }
}
