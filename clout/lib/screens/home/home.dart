import 'package:flutter/material.dart';

// widgets
import 'package:clout/widgets/header/header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Header(
          header: 0,
        ),
      ),
    );
  }
}
