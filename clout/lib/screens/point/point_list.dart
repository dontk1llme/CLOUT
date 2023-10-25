import 'package:flutter/material.dart';

class PointList extends StatefulWidget {
  const PointList({super.key});

  @override
  State<PointList> createState() => _PointListState();
}

class _PointListState extends State<PointList> {
  @override
  Widget build(BuildContext context) {
    return Text('포인트 내역');
  }
}
