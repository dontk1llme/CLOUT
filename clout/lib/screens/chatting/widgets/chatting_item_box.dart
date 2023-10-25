import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class ChattingItemBox extends StatelessWidget {
  const ChattingItemBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 203, 203, 203),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/clouterImage.jpg',
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('모카우유',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
              SizedBox(height: 3),
              Text('혹시 어떤 장난감인지 사이트나 사진...',
                  style: TextStyle(color: style.colors['gray'])),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('11:17'),
                SizedBox(
                  height: 3,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: style.colors['main1'],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: style.colors['white'],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
