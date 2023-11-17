import 'package:flutter/material.dart';

class Sns2 extends StatelessWidget {
  const Sns2({super.key, required this.selectedPlatform});

  final List<String> selectedPlatform;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: selectedPlatform.map((platform) {
        return Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Image.asset('assets/images/${platform}.png',
              width: 20, height: 20),
        );
      }).toList(),
    );
  }
}
