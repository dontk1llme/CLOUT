import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class CategoryToggle extends StatefulWidget {
  const CategoryToggle({Key? key}) : super(key: key);

  @override
  _CategoryToggleState createState() => _CategoryToggleState();
}

class _CategoryToggleState extends State<CategoryToggle> {
  List<bool> _selections1 = List.generate(12, (index) => false);
  final ImgList = [
    'all', 'cosmetics','barbell', 'airplane','baby','electronics',
    'food','location','paw','game','money','more',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8, // 가로 간격 설정
      runSpacing: 8, // 세로 간격 설정
      children: List.generate(2, (rowIndex) {
        return ToggleButtons(
          onPressed: (int innerIndex) {
            final currentIndex = rowIndex * 6 + innerIndex;
            setState(() {
              _selections1[currentIndex] = !_selections1[currentIndex];
            });
          },
          isSelected: _selections1.sublist(rowIndex * 6, (rowIndex + 1) * 6),
          borderColor: Color(0xFFF7F8F9),
          children: List.generate(6, (innerIndex) {
            final currentIndex = rowIndex * 6 + innerIndex;
            return Container(
              width: 55.5,
              height: 60,
              decoration: BoxDecoration(
                color: _selections1[currentIndex] ? style.colors['category'] : Color(0xFFE8ECF4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset('assets/images/${ImgList[currentIndex]}.png'),
            );
          }),
        );
      }),
    );
  }
}
