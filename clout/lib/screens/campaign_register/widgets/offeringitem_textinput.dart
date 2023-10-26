import 'package:clout/widgets/input/input_elements/input_element.dart';
import 'package:flutter/material.dart';

class OfferingitemTextinput extends StatelessWidget {
  OfferingitemTextinput({super.key, this.setOfferingItems});
  final setOfferingItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: InputElement(
        elementType: 'text',
        placeholder: '제공내역(제공할 물품 또는 서비스)',
        setData: setOfferingItems,
        maxLength: 300,
      ),
    );
  }
}
