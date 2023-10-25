// Global
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerDialog extends StatelessWidget {
  NumberPickerDialog({
    super.key,
    this.value,
    this.minValue,
    this.maxValue,
    this.setData,
  });

  var value;
  final minValue;
  final maxValue;
  final setData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("모집인원"),
      content: StatefulBuilder(builder: (context, setState) {
        return NumberPicker(
          value: value,
          minValue: minValue,
          maxValue: maxValue,
          onChanged: (newVal) {
            setState(() => value = newVal);
          },
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black26),
          ),
        );
      }),
      actions: <Widget>[
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setData(value);
              Navigator.of(context).pop(); //창 닫기
            },
            child: Text("확인"),
          ),
        ),
      ],
    );
  }
}
