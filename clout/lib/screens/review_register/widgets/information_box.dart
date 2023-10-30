import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

class InformationBox extends StatelessWidget {
  const InformationBox({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 40;
    final imageSize = screenWidth * 0.2;
    final textSpacing = screenWidth * 0.0375;
    final fontSize1 = screenWidth * 0.046;
    final fontSize2 = screenWidth * 0.03;
    final fontSize3 = screenWidth * 0.045;

    return Container(
      width: containerWidth,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: style.colors['white'],
        borderRadius: BorderRadius.circular(10),
        boxShadow: style.shadows['shadow'],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/clouterImage.jpg',
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: textSpacing,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '모카우유',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize1,
                ),
              ),
              Text(
                '2023.10.01 ~ 2023.10.25',
                style: TextStyle(
                  fontSize: fontSize2,
                ),
              ),
              Text(
                '80만 포인트',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize3,
                  color: style.colors['main1'],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
