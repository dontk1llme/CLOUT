import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/screens/mypage/contract.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class SmallContract extends StatefulWidget {
  const SmallContract({super.key});

  @override
  State<SmallContract> createState() => _SmallContractState();
}

class _SmallContractState extends State<SmallContract> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: style.colors['white'],
        borderRadius: BorderRadius.circular(5),
        boxShadow: style.shadows['shadow'],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataTitle(text: '못골영농조합법인'),
            SizedBox(height: 7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.card_giftcard_outlined,
                    size: 17, color: style.colors['main1']),
                Text(' 제공내역 ',
                    style: TextStyle(
                      fontSize: 13,
                    )),
                Text('1,000 포인트',
                    style: TextStyle(
                      fontSize: 13,
                      color: style.colors['main1'],
                    )),
              ],
            )
          ],
        ),
        // 💥 클라우터 전자서명 미진행시
        // 👉 클라우터한테는 << 계약서 작성 >> 버튼
        // 👉 광고주한테는 << 계약서 대기 >> 버튼
        // 광고주, 클라우터 전자서명  진행시 << 계약서 보기 >> 버튼
        ElevatedButton(
          onPressed: () => {Get.to(Contract())},
          style: ElevatedButton.styleFrom(
              backgroundColor: style.colors['main1'],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
          child: Text(
            '계약서 보기',
            style: style.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ]),
    );
  }
}
