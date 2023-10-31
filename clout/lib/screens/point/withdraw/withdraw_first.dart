import 'package:flutter/material.dart';
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/point/widgets/bank_dropdown.dart';
import 'package:clout/screens/point/widgets/main_text.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/buttons/big_button.dart';

class WithdrawFirst extends StatefulWidget {
  const WithdrawFirst({super.key});

  @override
  State<WithdrawFirst> createState() => _WithdrawFirstState();
}

class _WithdrawFirstState extends State<WithdrawFirst> {
  var bank;
  TextEditingController accountController = TextEditingController();

  setBank(input) {
    setState(() {
      bank = input;
    });
    print(bank);
  }

  Future goSecond(BuildContext context, String bank, String account) async {
    final arguments = {
      'bank': bank,
      'account': accountController.text,
    };
    print(arguments);
    Get.toNamed('/withdrawsecond', arguments: arguments);
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
                MainText(textTitle: '송금 받을 계좌를'),
                MainText(textTitle: '입력해주세요'),
                SizedBox(height: 20),
                // BankDropdown(bank: category, setBank: setCategory),
                BankDropdown(
                  bank: bank,
                  setBank: setBank,
                ),
                TextFormField(
                  controller: accountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: '계좌번호 (- 없이 입력해주세요)'),
                  textInputAction: TextInputAction.next,
                ),
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
            title: '다음',
            // destination: "withdrawsecond",
            function: () => goSecond(context, bank, accountController.text),
          ),
        ),
      ),
    );
  }
}
