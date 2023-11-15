import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';
import 'package:clout/screens/contract_list/widgets/contract_button.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

class SmallContract extends StatefulWidget {
  final String name;
  final String pay;
  final bool progress;

  const SmallContract({
    super.key,
    required this.name,
    required this.pay,
    required this.progress,
  });

  @override
  State<SmallContract> createState() => _SmallContractState();
}

class _SmallContractState extends State<SmallContract> {
  final userController = Get.find<UserController>();

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
            DataTitle(text: widget.name),
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
                Text('${widget.pay} 포인트',
                    style: TextStyle(
                      fontSize: 13,
                      color: style.colors['main1'],
                    )),
              ],
            )
          ],
        ),
        widget.progress == false
            ? userController.memberType == -1
                ? ContractButton(title: '계약서 작성')
                : ContractButton(title: '계약서 대기')
            : ContractButton(title: '계약서 보기'),
      ]),
    );
  }
}
