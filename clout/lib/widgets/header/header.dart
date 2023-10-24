import 'package:flutter/material.dart';
import '../../style.dart' as style;

class Header extends StatelessWidget {
  Header({super.key, this.header, this.headerTitle});

  final header;
  final headerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      centerTitle: header == 4 ? false : true,
      iconTheme: IconThemeData(color: Colors.black),
      leading: header == 0 || header == 1
          ? IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined))
          : IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
      title: header == 0
          ? Image.asset(
              'assets/images/Clout_Logo.png',
              height: 22,
            )
          : headerTitle != null
              ? Text(headerTitle,
                  style: style.textTheme.titleSmall
                      ?.copyWith(color: style.colors['text'], fontWeight: FontWeight.w700))
              : null,
      actions: header != 3 && header != 4
          ? [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.notifications_outlined))
            ]
          : null,
    );
  }
}
