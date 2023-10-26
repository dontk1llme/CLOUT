import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RegionMultiSelect extends StatefulWidget {
  RegionMultiSelect({super.key, this.selectedRegions, this.setSelectedRegions});
  final selectedRegions;
  final setSelectedRegions;

  @override
  State<RegionMultiSelect> createState() => _RegionMultiSelectState();
}

class _RegionMultiSelectState extends State<RegionMultiSelect> {
  var valuesHere = [];
  final regions = [
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
  Widget build(BuildContext context) {
    return MultiSelectBottomSheetField(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      isDismissible: true,
      title: DataTitle(text: '지역 선택'),
      buttonText: Text("지역 선택"),
      separateSelectedItems: true,
      searchable: true,
      items: regions.map((e) => MultiSelectItem(e, e)).toList(),
      onSelectionChanged: (value) {
        if (value.contains('전체') && value.length != regions.length) {
          setState(() {
            valuesHere = regions;
          });
          widget.setSelectedRegions(regions);
        }
      },
      // validator: (values) {
      //   if (values == null || values.isEmpty) {
      //     return "Required";
      //   }
      //   var names = [];
      //   names = values;
      //   if (names.contains('전체')) {
      //     return '전체';
      //   }
      // },
      onConfirm: (values) {
        setState(() {
          valuesHere = values;
        });
        // widget.setSelectedRegions(values);
        // widget.selectedRegions.currentState.validate();
      },
      chipDisplay: MultiSelectChipDisplay(
        onTap: (item) {
          setState(() {
            valuesHere.remove(item);
          });
          // widget.setSelectedRegions(item);
          // widget.selectedRegions.currentState.validate();
        },
      ),
    );
  }
}
