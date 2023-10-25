import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  // 이미지 파일 경로, 제목 리스트
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
    return Container(
      width: double.infinity,
      height: 225,
      color: Color(0xffF6F4FF),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // 첫 번째 행의 이미지 버튼
            children: _categoryButtons(0, 5),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // 두 번째 행 이미지 버튼
            children: _categoryButtons(6, 11),
          )
        ],
      ),
    );
  }

  List<Widget> _categoryButtons(int startIndex, int lastIndex) {
    // 이미지 버튼 위젯 리스트 생성
    return List.generate(
      lastIndex - startIndex + 1,
      (index) => Column(
        children: [
          _categoryButton(categoryData[startIndex + index]['path']!),
          Text(categoryData[startIndex + index]['name']!,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }

  Widget _categoryButton(String imagePath) {
    return InkWell(
      onTap: () {
        // 버튼 눌렀을 때 실행
      },
      child: Container(
        width: 60, // 이미지버튼 너비
        height: 60, // 이미지버튼 높이
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: Colors.white, // 버튼 배경색
          borderRadius: BorderRadius.circular(13), // 버튼 모서리
        ),
        child: Image.asset(imagePath), // 이미지 불러오기
      ),
    );
  }
}
