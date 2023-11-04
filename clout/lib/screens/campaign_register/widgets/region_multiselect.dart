import 'package:clout/providers/region_controller.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RegionMultiSelect extends StatefulWidget {
  RegionMultiSelect({super.key, required this.controllerTag});
  final controllerTag;
  static List<String> regions = [
    '전체',
    '서울',
    '부산',
    '대구',
    '인천',
    '광주',
    '대전',
    '울산',
    '세종',
    '경기',
    '강원',
    '충북',
    '충남',
    '전북',
    '전남',
    '경북',
    '경남',
    '제주',
  ];

  @override
  State<RegionMultiSelect> createState() => _RegionMultiSelectState();
}

class _RegionMultiSelectState extends State<RegionMultiSelect> {
  List<String?> valuesHere = [];

  final items = RegionMultiSelect.regions
      .map((e) => MultiSelectItem<String>(e, e))
      .toList();

  @override
  Widget build(BuildContext context) {
    // final regionController = Get.put(RegionController());
    // var savedItems =
    //     regionController.selectedRegions.map((e) => e as String).toList();

    // setState(() {
    //   valuesHere = savedItems;
    // });

    return GetBuilder<RegionController>(
        tag: widget.controllerTag,
        builder: (controller) => Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: style.colors['gray']!),
                borderRadius: BorderRadius.circular(5)),
            child: MultiSelectBottomSheetField<String?>(
              initialValue: controller.selectedRegions,
              initialChildSize: 0.7,
              maxChildSize: 0.9,
              minChildSize: 0.5,
              isDismissible: true,
              buttonIcon: Icon(Icons.place_outlined),
              title: Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 5),
                child: Row(
                  children: [
                    Icon(Icons.place_outlined),
                    Text(
                      ' 지역 선택',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.3),
                    )
                  ],
                ),
              ),
              buttonText: Text(
                "여러 지역 선택 가능(항목 터치시 삭제)",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              // searchable: true,
              items: items,
              decoration: BoxDecoration(),
              cancelText: Text(
                "취소",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: style.colors['main1']),
              ),
              confirmText: Text(
                "확인",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: style.colors['main1']),
              ),
              onConfirm: (values) {
                setState(() {
                  valuesHere = values;
                });
                controller.setSelectedRegions(valuesHere);
              },
              chipDisplay: MultiSelectChipDisplay(
                chipColor: style.colors['main1'],
                textStyle:
                    TextStyle(color: style.colors['white'], fontSize: 15),
                height: 20.0,
                icon: Icon(Icons.close, color: Colors.white),
                onTap: (item) {
                  setState(() {
                    valuesHere.remove(item);
                  });
                  controller.setSelectedRegions(valuesHere);
                },
              ),
            )));
  }
}
