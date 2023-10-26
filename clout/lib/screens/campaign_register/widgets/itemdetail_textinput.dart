import 'package:clout/widgets/input/input_elements/input_element.dart';
import 'package:flutter/material.dart';


class ItemdetailTextinput extends StatelessWidget {
  ItemdetailTextinput({super.key, this.setItemDetail});
  final setItemDetail;

  @override
  Widget build(BuildContext context) {
    return InputElement(
      elementType: 'text',
      placeholder: '제품 또는 서비스 상세 내용',
      setData: setItemDetail,
      maxLength: 500,
      keyboardType: TextInputType.multiline,
    );
  }
}
