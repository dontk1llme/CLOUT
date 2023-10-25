// Global
import 'package:clout/screens/home/widgets/number_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clout/style.dart' as style;

// Widgets
import 'package:clout/widgets/input/input_elements/widgets/text_input.dart';
import 'package:clout/widgets/input/input_elements/widgets/dropdown_input.dart';

class InputElement extends StatelessWidget {
  InputElement(
      {super.key,
      this.elementType,
      this.placeholder,
      this.data,
      this.setData,
      this.value,
      this.keyboardType,
      this.maxLength,
      this.maxValue,
      this.minValue}) {
    keyboardType ??= TextInputType.text;
    maxLength ??= 600;
    maxValue ??= -1;
    minValue ??= 0;
  }

  final elementType;
  final placeholder;
  final data;
  final setData;
  final value;
  TextInputType? keyboardType;
  int? maxLength;
  int? maxValue;
  int? minValue;

  @override
  Widget build(BuildContext context) {
    if (elementType == 'text') {
      return TextInput(
        placeholder: placeholder,
        setData: setData,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxValue: maxValue,
      );
    } else if (elementType == 'dropdown') {
      return DropdownInput(
        placeholder: placeholder,
        data: data,
        setData: setData,
        value: value,
      );
    } else {
      return placeholder();
    }
  }
}
