import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:url_launcher/url_launcher.dart';

class SnsItemBox extends StatelessWidget {
  final String username;
  final String followers;
  final String imageName;
  final String snsUrl;

  SnsItemBox({
    required this.username,
    required this.followers,
    required this.imageName,
    required this.snsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(snsUrl));
        print('연결된 링크로 이동~👻');
      },
      child: Container(
        width: 120,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          // color: Color(0xFFE8ECF4),
          color: style.colors['main3'],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageName, width: 70, height: 70),
            SizedBox(height: 5),
            Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              followers,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
