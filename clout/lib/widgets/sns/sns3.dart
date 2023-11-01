import 'package:clout/providers/serach_detail_controller.dart';
import 'package:clout/widgets/sns/widgets/sns3_select_box.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

<<<<<<< HEAD
class Sns3 extends StatefulWidget {
  const Sns3({Key? key}) : super(key: key);
  

  @override
  _Sns3State createState() => _Sns3State();
}

class _Sns3State extends State<Sns3> {
  List<bool> _selections1 = [false, false, false];
  var wd = double.infinity/3; //얘 활용해서 반응형으로 하고 싶었는데 안 됨
=======
class Sns3 extends StatelessWidget {
  Sns3({super.key});
>>>>>>> 811ad1bc3b2313efcd27bf6261999371f1c8f4ee

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
