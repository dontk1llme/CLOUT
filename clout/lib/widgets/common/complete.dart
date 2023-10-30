import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/buttons/big_button.dart';

// ✅ alertText: 아이콘 밑에 뜨게 할 메시지
// ✅ buttonText: 버튼에 들어갈 text 내용
// ✅ onPressed: 버튼 눌렀을 때 실행할 함수
// ✅ pageName: 버튼 눌렀을 때 이동시킬 페이지 명

// 👇 아래 내용 복붙해서 사용하면 됨 !!!
// CompletePage(
//   alertText: '출금 신청 완료!',
//   buttonText: '포인트 내역으로 이동',
//   onPressed: () {},
//   pageName: "pointlist",
// );

class CompletePage extends StatelessWidget {
  final String alertText;
  final String buttonText; // 버튼 텍스트를 설정하기 위한 변수
  final VoidCallback onPressed; // 버튼을 눌렀을 때 실행할 함수
  final String pageName;

  CompletePage({
    required this.alertText,
    required this.buttonText,
    required this.onPressed,
    required this.pageName,
  });

  movePage(destination) {
    Get.toNamed(destination);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified,
                    size: 120,
                    color: style.colors['main1'],
                  ),
                  SizedBox(height: 20),
                  Text(
                    alertText,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
              child: BigButton(
                title: buttonText,
                destination: "${pageName}",
                notJustRoute: true,
                function: movePage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
