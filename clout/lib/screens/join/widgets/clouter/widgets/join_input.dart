import 'package:clout/providers/clouter_register_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class JoinInput extends StatelessWidget {
  const JoinInput(
      {super.key,
      required this.keyboardType,
      required this.maxLength,
      required this.title,
      required this.label,
      required this.setState});

  final keyboardType;
  final maxLength;
  final title;
  final label;
  final setState;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLength: maxLength,
      onChanged: (value) => setState(value),
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.only(top: 30, left: 15, right: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        hintText: title,
        labelText: label,
        floatingLabelStyle: TextStyle(color: style.colors['main1']),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            width: 2,
            color: style.colors['main1']!,
          ),
        ),
      ),
    );
  }
}
