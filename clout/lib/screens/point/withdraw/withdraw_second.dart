import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/point/widgets/main_text.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/buttons/big_button.dart';

class WithdrawSecond extends StatefulWidget {
  const WithdrawSecond({super.key});

  @override
  State<WithdrawSecond> createState() => _WithdrawSecondState();
}

class _WithdrawSecondState extends State<WithdrawSecond> {
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
              destination: '/withdrawsecond',
            ),
          ),
        ));
  }
}
