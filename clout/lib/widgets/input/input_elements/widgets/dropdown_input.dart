import 'package:flutter/material.dart';

class DropdownInput extends StatelessWidget {
  const DropdownInput(
      {super.key, this.placeholder, this.data, this.setData, this.value});

  final placeholder;
  final data;
  final setData;
  final value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 55,
        child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black38,
                    width: 1), //border of dropdown button
                borderRadius: BorderRadius.circular(
                    5)), //border raiuds of dropdown button),
            child: DropdownButton(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              underline: SizedBox.shrink(),
              alignment: Alignment.centerLeft,
              hint: Text(placeholder),
              isExpanded: true,
              value: value,
              items: data.map<DropdownMenuItem<String>>((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (selected) => setData(selected),
            )));
  }
}
