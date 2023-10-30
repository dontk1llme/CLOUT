import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class CategoryList extends StatefulWidget {
  CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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

  List<int> selectedCategories = [];

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
    final uniqueIndexes = List.generate(
        lastIndex - startIndex + 1, (index) => startIndex + index);

    return uniqueIndexes.map((index) {
      return Column(
        children: [
          _categoryButton(
            context,
            categoryData[index]['path']!,
            buttonSize,
            index,
          ),
          Text(categoryData[index]['name']!,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              )),
        ],
      );
    }).toList();
  }

  Widget _categoryButton(
      BuildContext context, String imagePath, double buttonSize, int index) {
    final double imageSize = buttonSize;
    final double paddingSize = imageSize / 6;

    bool isSelected = selectedCategories.contains(index);

    return InkWell(
      onTap: () {
        setState(() {
          if (index == 0) {
            selectedCategories.clear();
            selectedCategories.add(0);
          } else {
            selectedCategories.remove(0);
            if (selectedCategories.contains(index)) {
              selectedCategories.remove(index);
            } else {
              selectedCategories.add(index);
            }
          }
          _fetchSearchResults();
        });
      },
      child: Container(
        width: imageSize,
        height: imageSize,
        padding: EdgeInsets.all(paddingSize),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: isSelected ? style.colors['main2'] : style.colors['white'],
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

  //  💥 API 호출 및 결과 처리 메소드
  void _fetchSearchResults() {
    // 여기서
    print("선택된 카테고리: $selectedCategories");
  }
}
