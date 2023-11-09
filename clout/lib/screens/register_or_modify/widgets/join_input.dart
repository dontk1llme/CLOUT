import 'package:clout/providers/four_digits_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class JoinInput extends StatefulWidget {
  JoinInput(
      {super.key,
      required this.keyboardType,
      required this.maxLength,
      required this.title,
      required this.label,
      required this.setState,
      required this.enabled,
      this.index,
      this.obscured,
      this.initialValue,
      this.inputFormatters,
      this.textInputAction,
      this.controllerTag});
  final keyboardType;
  final maxLength;
  final title;
  final label;
  final setState;
  final index;
  final obscured;
  final enabled;
  final initialValue;
  var inputFormatters;
  var textInputAction;
  var controllerTag;

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
      enabled: widget.enabled,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.index == null
          ? (value) {
              widget.setState(value);
              if (widget.controllerTag != null) {
                final pinController = Get.find<FourDigitsInputController>(
                    tag: widget.controllerTag);
                pinController.setPhoneVerified(false);
              }
            }
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
