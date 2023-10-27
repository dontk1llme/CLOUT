import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.manage_accounts,
        size: 18,
        color: Colors.white,
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(style.colors['main1'])),
      label: Text(
        "회원정보 수정",
      ),
    );
  }
}
