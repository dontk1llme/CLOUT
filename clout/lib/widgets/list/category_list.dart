import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  final List<Map<String, String>> categoryData = [
    {'path': 'assets/images/all.png', 'name': '전체보기'},
    {'path': 'assets/images/cosmetics.png', 'name': '패션/뷰티'},
    {'path': 'assets/images/barbell.png', 'name': '건강/생활'},
    {'path': 'assets/images/airplane.png', 'name': '여행/레저'},
    {'path': 'assets/images/baby.png', 'name': '육아'},
    {'path': 'assets/images/electronics.png', 'name': '전자제품'},
    {'path': 'assets/images/food.png', 'name': '음식'},
    {'path': 'assets/images/location.png', 'name': '방문/체험'},
    {'path': 'assets/images/paw.png', 'name': '반려동물'},
    {'path': 'assets/images/game.png', 'name': '게임'},
    {'path': 'assets/images/money.png', 'name': '경제/사업'},
    {'path': 'assets/images/more.png', 'name': '기타'},
  ];

  @override
  build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonSize = screenWidth / 7; // 이미지 버튼 크기를 화면 너비에 따라 조정

    return Container(
      width: double.infinity,
      height: 225,
      color: Color(0xffF6F4FF),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _categoryButtons(context, 0, 5, buttonSize),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _categoryButtons(context, 6, 11, buttonSize),
          )
        ],
      ),
    );
  }

  List<Widget> _categoryButtons(
      BuildContext context, int startIndex, int lastIndex, double buttonSize) {
    return List.generate(
      lastIndex - startIndex + 1,
      (index) => Column(
        children: [
          _categoryButton(
            context,
            categoryData[startIndex + index]['path']!,
            buttonSize,
          ),
          Text(categoryData[startIndex + index]['name']!,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }

  Widget _categoryButton(
      BuildContext context, String imagePath, double buttonSize) {
    final double imageSize = buttonSize;
    final double paddingSize = imageSize / 6;

    return InkWell(
      onTap: () {
        // 버튼 눌렀을 때 실행
      },
      child: Container(
        width: imageSize,
        height: imageSize,
        padding: EdgeInsets.all(paddingSize),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Image.asset(
          imagePath,
          width: imageSize - 2 * paddingSize,
          height: imageSize - 2 * paddingSize,
        ),
      ),
    );
  }
}
