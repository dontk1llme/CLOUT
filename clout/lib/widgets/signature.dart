import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class Signature extends StatefulWidget {
  const Signature({super.key, required this.globalKey});
  final globalKey;

  @override
  State<Signature> createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  void _handleClearButtonPressed() {
    widget.globalKey.currentState!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            // borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: SfSignaturePad(
              key: widget.globalKey,
              backgroundColor: Colors.transparent,
              strokeColor: Colors.black,
              minimumStrokeWidth: 1.0,
              maximumStrokeWidth: 4.0),
        ),
        // SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton.icon(
              onPressed: _handleClearButtonPressed,
              icon: Icon(
                Icons.restart_alt_outlined,
                color: style.colors['main1'],
              ),
              label: Text('초기화',
                  style: TextStyle(color: style.colors['main1'], height: 1.25)),
            )
          ],
        )
      ],
    );
  }
}
