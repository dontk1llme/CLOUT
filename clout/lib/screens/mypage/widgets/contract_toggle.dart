import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class ContractToggle extends StatefulWidget {
  const ContractToggle({Key? key}) : super(key: key);

  @override
  _ContractToggleState createState() => _ContractToggleState();
}

class _ContractToggleState extends State<ContractToggle> {
  List<bool> _selections1 = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (int index) {
        setState(() {
          _selections1[index] = !_selections1[index];
        });
      },
      isSelected: _selections1,
      // selectedBorderColor: style.colors['category'], // 선택되었을 때의 테두리 색상
      borderColor: Color(0xFFF7F8F9), // 선택되지 않았을 때의 테두리 색상
      children: <Widget>[
        Container(
          width: 112,
          height: 60,
          decoration: BoxDecoration(
            color: _selections1[0] ? style.colors['category'] : Color(0xFFE8ECF4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),  
              bottomLeft: Radius.circular(8),
                  ),),
          child: Image.asset('assets/images/Instagram.png'),
        ),
        Container(
          width: 112,
          height: 60,
          color: _selections1[1] ? style.colors['category'] : Color(0xFFE8ECF4), 
          child: Image.asset('assets/images/TikTok.png'),
        ),
        Container(
          width: 112,
          height: 60,
          decoration: BoxDecoration(
            color: _selections1[2] ? style.colors['category'] : Color(0xFFE8ECF4),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),   
              bottomRight: Radius.circular(8), 
            ),),
          child: Image.asset('assets/images/YouTube.png'),
        ),
      ],
    );
  }
}
