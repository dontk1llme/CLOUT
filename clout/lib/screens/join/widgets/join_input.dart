import 'package:clout/providers/clouter_register_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class JoinInput extends StatefulWidget {
  JoinInput(
      {super.key,
      required this.keyboardType,
      required this.maxLength,
      required this.title,
      required this.label,
      required this.setState,
      this.index,
      this.obscured,
      this.enabled,
      this.initialValue});
  final keyboardType;
  final maxLength;
  final title;
  final label;
  final setState;
  final index;
  final obscured;
  final enabled;
  final initialValue;

  @override
  State<JoinInput> createState() => _JoinInputState();
}

class _JoinInputState extends State<JoinInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      initialValue: widget.initialValue,
      enabled: (widget.enabled != false) ? true : false,
      onChanged: widget.index == null
          ? (value) => widget.setState(value)
          : (value) => widget.setState(widget.index, value),
      obscureText: widget.obscured ?? false,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.only(top: 30, left: 15, right: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        hintText: widget.title,
        labelText: widget.label,
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
