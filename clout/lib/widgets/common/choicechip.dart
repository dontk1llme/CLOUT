import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

void main() => runApp(const ChipApp());

class ChipApp extends StatelessWidget {
  const ChipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: const ActionChoiceExample(
        labels: ['제목 1', '제목 2', '제목 3'],
        chipCount: 4,
      ),
    );
  }
}

class ActionChoiceExample extends StatefulWidget {
  final List<String> labels;
  final int chipCount;

  const ActionChoiceExample(
      {Key? key, required this.labels, required this.chipCount})
      : super(key: key);

  @override
  State<ActionChoiceExample> createState() => _ActionChoiceExampleState();
}

class _ActionChoiceExampleState extends State<ActionChoiceExample> {
  int? _value = 0; // 선택된 choicechip의 인덱스

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: <Widget>[
            Wrap(
              spacing: 5,
              children: List<Widget>.generate(
                widget.chipCount,
                (int index) {
                  return ChoiceChip(
                    label: Text(widget.labels[index]),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                      });
                    },
                    backgroundColor: _value == index
                        ? style.colors['main2']
                        : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: style.colors['category']!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    selectedColor: style.colors['category'],
                  );
                },
              ).toList(),
            ),
          ],
        ));
  }
}
