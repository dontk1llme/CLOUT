import 'package:clout/providers/serach_detail_controller.dart';
import 'package:clout/widgets/sns/widgets/sns3_select_box.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class Sns3 extends StatelessWidget {
  Sns3({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchDetailController());
    final screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<SearchDetailController>(
      builder: (controller) => Container(
          color: Colors.white,
          width: screenWidth,
          // height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Sns3SelectBox(
                    img: 'assets/images/Instagram.png',
                    index: 0,
                    title: 'Instagram'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Sns3SelectBox(
                    img: 'assets/images/TikTok.png', index: 1, title: 'Tiktok'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Sns3SelectBox(
                    img: 'assets/images/YouTube.png',
                    index: 2,
                    title: 'Youtube'),
              ),
            ],
          )),
    );
  }
}
