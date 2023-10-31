import 'package:clout/providers/image_picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../../style.dart' as style;

class Header extends ConsumerStatefulWidget {
  const Header({super.key, this.header, this.headerTitle});

  final header;
  final headerTitle;

  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends ConsumerState<Header> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      centerTitle: widget.header == 4 ? false : true,
      iconTheme: IconThemeData(color: Colors.black),
      leading: widget.header == 0 || widget.header == 1
          ? IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined))
          : IconButton(
              onPressed: () {
                Get.back();
                ref.invalidate(
                    imagePickerProvider); // 뒤로 가기 할 경우 campaignRegister에 있던 사진 내용 provider 초기화 시켜줘야함
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined)),
      title: widget.header == 0
          ? Image.asset(
              'assets/images/Clout_Logo.png',
              height: 22,
            )
          : widget.headerTitle != null
              ? Text(widget.headerTitle,
                  style: style.textTheme.titleSmall?.copyWith(
                      color: style.colors['text'],
                      fontWeight: FontWeight.w700,
                      height: 1))
              : null,
      actions: widget.header != 3 && widget.header != 4
          ? [
              IconButton(
                  onPressed: () => Get.toNamed('/notification'),
                  icon: Icon(Icons.notifications_outlined))
            ]
          : null,
    );
  }
}
