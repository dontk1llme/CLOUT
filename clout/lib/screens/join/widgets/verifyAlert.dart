import 'package:flutter/material.dart';

class VerifyAlert {
  static void show(BuildContext context, String titleText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleText),
          content: Text('다시 시도해 주세요!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
