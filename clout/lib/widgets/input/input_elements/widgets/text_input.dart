import 'package:clout/widgets/input/input_elements/utilities/numeric_range_formatter.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class TextInput extends StatelessWidget {
  TextInput(
      {super.key,
      required this.setData,
      required this.placeholder,
      this.keyboardType,
      required this.maxLength,
      required this.maxValue});

  final setData;
  final placeholder;
  final keyboardType;
  final maxLength;
  final maxValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters:
          maxValue != -1 ? [NumericRangeFormatter(min: 0, max: maxValue)] : [],
      onChanged: (value) => setData(value),
      keyboardType: keyboardType,
      minLines: 5,
      maxLines: 5,
      maxLength: maxLength,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 30, left: 15, right: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          counterText: maxLength < 200 ? "" : null,
          hintText: placeholder,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              width: 2,
              color: style.colors['main1']!,
            ),
          )),
    );
  }
}
