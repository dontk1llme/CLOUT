import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/point/widgets/main_text.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/screens/point/withdraw/widgets/bold_text.dart';
import 'package:clout/screens/point/withdraw/widgets/medium_text.dart';

class WithdrawSecond extends StatefulWidget {
  const WithdrawSecond({super.key, this.bank, this.account});

  final String? bank;
  final String? account;

  @override
  State<WithdrawSecond> createState() => _WithdrawSecondState();
}

class _WithdrawSecondState extends State<WithdrawSecond> {
  TextEditingController pointController = TextEditingController();
  double amount = 0;

  var f = NumberFormat('###,###,###,###');

  String getCurrentDate() {
    final now = DateTime.now();
    final nextMonth = now.add(Duration(days: 30)); // 다음 달로 이동
    final nextMonth15th = DateTime(nextMonth.year, nextMonth.month, 15);
    final formatter = DateFormat('MM월 dd일');

    return formatter.format(nextMonth15th);
  }

  void _showModal() {
    try {
      amount = double.parse(pointController.text);
    } catch (e) {
      // pointController.text를 숫자로 변환할 수 없을 때 처리
      print('계산 불가... 💨: ${pointController.text}');
      // 다른 기본값을 설정하거나 오류 메시지 표시..
    }
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.close,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              BoldText(text: '수수료 7% 차감 후'),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(getCurrentDate(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: style.colors['main1'])),
                  SizedBox(width: 5),
                  MediumText(text: '지급됩니다.'),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumText(text: '출금 신청 금액'),
                      SizedBox(height: 5),
                      MediumText(text: '수수료'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BoldText(text: '${f.format(amount)} 원'),
                      SizedBox(height: 5),
                      BoldText(
                          text: '- ${f.format((amount * 0.07).floor())} 원'),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  color: style.colors['lightgray'],
                  height: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(text: '실 지급 금액'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${f.format(amount - (amount * 0.07).floor())} 원',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: style.colors['main1'])),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: SizedBox(
                  height: 30,
                  width: 230,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: style.colors['category'],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                      children: [
                        Icon(Icons.check, color: style.colors['main1']),
                        SizedBox(width: 3),
                        Text('내용을 확인했습니다.'),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    height: 50,
                    child: BigButton(
                        title: '아니요',
                        textColor: Colors.black,
                        buttonColor: style.colors['lightgray'],
                        function: () {
                          Get.back();
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 140,
                    height: 50,
                    child: BigButton(
                      title: '출금하기',
                      destination: "withdrawcomplete",
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    // final account = widget.account;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(header: 4, headerTitle: '')),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: BouncingListview(
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('${args['bank']}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text('계좌번호 : ${args['account']}',
                    style: TextStyle(fontSize: 15)),
                SizedBox(height: 10),
                MainText(textTitle: '얼마를 보낼까요?'),
                SizedBox(height: 20),
                TextFormField(
                  controller: pointController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '보낼금액 (원)',
                    labelStyle: TextStyle(
                        fontSize: 20, color: style.colors['lightgray']),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('출금 가능 포인트: 130,000 points'),
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: BigButton(
            title: '출금',
            function: () => _showModal(),
            // destination: "withdrawcomplete",
          ),
        ),
      ),
    );
  }
}
