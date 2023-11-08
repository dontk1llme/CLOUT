import 'package:clout/providers/region_controller.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/widgets/buttons/small_button.dart';
import 'package:clout/widgets/region_multiselect_chip.dart';
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
  void showBottomSheet() {
    final regionController =
        Get.find<RegionController>(tag: widget.controllerTag);
    Get.bottomSheet(
      backgroundColor: Colors.white,
      isDismissible: true,
      isScrollControlled: false,
      BouncingListview(
        child: Wrap(
          children: RegionMultiSelect.regions
              .map((e) => ListTile(
                    onTap: () => regionController.selectedRegions.contains(e)
                        ? regionController.removeRegion(e)
                        : regionController.addRegion(e),
                    leading: regionController.selectedRegions.contains(e)
                        ? Icon(
                            Icons.check_box_outlined,
                            color: Colors.blue,
                          )
                        : Icon(Icons.check_box_outline_blank_outlined),
                    title: Text(e),
                  ))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegionController>(
      tag: widget.controllerTag,
      builder: (controller) => Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: style.colors['gray']!),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: style.colors['white'],
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    side: BorderSide.none),
                elevation: 0,
              ),
              onPressed: showBottomSheet,
              child: ListTile(
                leading: Icon(Icons.place_outlined, size: 40),
                contentPadding: EdgeInsets.all(0),
                title: Text('여러 지역 선택 가능'),
                subtitle: Text('항목 터치시 삭제'),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Wrap(
              children: controller.selectedRegions
                  .map(
                    (e) => RegionMultiselectChip(
                      title: e,
                      controllerTag: widget.controllerTag,
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
