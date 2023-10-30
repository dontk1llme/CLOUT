import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/point/widgets/main_text.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:clout/screens/point/withdraw/widgets/bold_text.dart';
import 'package:clout/screens/point/withdraw/widgets/medium_text.dart';

class WithdrawSecond extends StatefulWidget {
  const WithdrawSecond({super.key});

  @override
  State<WithdrawSecond> createState() => _WithdrawSecondState();
}

class _WithdrawSecondState extends State<WithdrawSecond> {
  void _showModal() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BoldText(text: '수수료 7% 차감 후'),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('11월 15일',
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
                      BoldText(text: '100,000 원'),
                      SizedBox(height: 5),
                      BoldText(text: '- 7,000 원'),
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
                      Text('93,000원',
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
                children: [
                  Flexible(
                    flex: 1,
                    child: BigButton(
                        title: '아니요',
                        textColor: Colors.black,
                        buttonColor: style.colors['lightgray'],
                        function: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      flex: 1,
                      child: BigButton(
                        title: '출금하기',
                      )),
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
                  Text('김보연님께',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('신한 110-123-456789', style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  MainText(textTitle: '얼마를 보낼까요?'),
                  SizedBox(height: 20),
                  TextFormField(
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BigButton(
              title: '출금',
              function: _showModal,
            ),
          ),
        ));
  }
}
