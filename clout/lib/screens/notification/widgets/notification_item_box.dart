import 'package:clout/screens/campaign_list/campaign_list.dart';
import 'package:clout/screens/mypage/contract.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// screens
import 'package:clout/screens/review_register/review_register.dart';
import 'package:clout/screens/clouter/clouter_select.dart';

class NotificationItem extends StatefulWidget {
  final int result;
  final String image;
  final String name;

  // 📌 result가 -1 이면 계약 불발, 0이면 계약서 작성, 1이면 계약 성사 완료

  const NotificationItem(
      {super.key,
      required this.result,
      required this.name,
      required this.image});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth > 400 ? 15 : 10,
          vertical: screenWidth > 400 ? 7 : 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: screenWidth > 400
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5), // 5% of screen width
              child: Image.asset(
                widget.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: screenWidth - 200,
              child: Wrap(
                // runAlignment: WrapAlignment.spaceBetween,
                // runSpacing: 30,
                // spacing: screenWidth - 600,
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          )),
                      Text(
                          widget.result != -1
                              ? widget.result == 1
                                  ? '계약이 성사되었어요! 🎉'
                                  : '계약서가 도착했어요! 💌'
                              : '계약이 불발되었어요 😥',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          )),
                      Text(
                          widget.result != -1
                              ? widget.result == 1
                                  ? '광고 효과를 기대해보세요'
                                  : '계약내용을 확인해보세요'
                              : '더 좋은 계약을 하실 수 있을거에요',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: style.colors['gray'],
                            fontSize: 14,
                          )),
                      // SizedBox(
                      //   width: 200,
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       Get.to(() =>
                      //           widget.result != -1 ? Contract() : CampaignList());
                      //     },
                      //     style: ButtonStyle(
                      //       backgroundColor: MaterialStateProperty.all<Color>(
                      //         Color(0xFF6B4EFF),
                      //       ),
                      //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //         RoundedRectangleBorder(
                      //           borderRadius:
                      //               BorderRadius.circular(screenWidth * 0.1),
                      //         ),
                      //       ),
                      //     ),
                      //     child: Text(widget.result != -1
                      //         ? widget.result == 1
                      //             ? '계약서 열람하기'
                      //             : '계약서 작성하기'
                      //         : '다른 캠페인 찾기'),
                      //   ),
                      // )
                    ],
                  ),
                  // SizedBox(width: screenWidth - 600),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() =>
                            widget.result != -1 ? Contract() : CampaignList());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF6B4EFF),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.1),
                          ),
                        ),
                      ),
                      child: Text(widget.result != -1
                          ? widget.result == 1
                              ? '계약서 열람하기'
                              : '계약서 작성하기'
                          : '다른 캠페인 찾기'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
