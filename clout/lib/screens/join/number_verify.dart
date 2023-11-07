import 'package:clout/screens/join/widgets/four_digits_input.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class NumberVerify extends StatelessWidget {
  const NumberVerify({super.key, required this.phoneNumber});
  final phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          heightFactor: 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('문자로 발송된', style: style.textTheme.titleMedium),
                  Row(
                    children: [
                      Text('인증번호',
                          style: style.textTheme.titleMedium
                              ?.copyWith(color: style.colors['main1'])),
                      Text('를', style: style.textTheme.titleMedium),
                    ],
                  ),
                  Text('입력해 주세요', style: style.textTheme.titleMedium),
                  SizedBox(height:10),
                  Text(phoneNumber),
                ],
              ),
              SizedBox(height: 30),
              FourDigitsInput(),
            ],
          ),
        ),
      ),
    );
  }
}
