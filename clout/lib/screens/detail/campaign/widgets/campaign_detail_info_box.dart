import 'package:clout/screens/detail/campaign/campaign_detail.dart';
import 'package:clout/widgets/common/nametag.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:intl/intl.dart';

class CampaignDetailInfoBox extends StatelessWidget {
  final Campaign campaign;
  CampaignDetailInfoBox({super.key, required this.campaign});

  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: style.colors['gray']!),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          NameTag(title: '카테고리'),
          SizedBox(height: 10),
          Text(
            campaign.productName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.corporate_fare_outlined),
              SizedBox(width: 10),
              Text('협찬 제공사', style: TextStyle(fontSize: 15)),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    campaign.campaignSubject,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 2),
                      Text(campaign.starRating.toString(),
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ],
                  ),
                ],
              ))
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.receipt_long_outlined),
              SizedBox(width: 10),
              Text('희망 플랫폼', style: TextStyle(fontSize: 15)),
              Expanded(
                  child: Text(
                campaign.preferredPlatform,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ))
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.event_outlined),
              SizedBox(width: 10),
              Text('신청 기간', style: TextStyle(fontSize: 15)),
              Expanded(
                  child: Text(
                campaign.endDate,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ))
            ],
          ),
          SizedBox(height: 5),
          Row(children: [
            Icon(Icons.monetization_on_outlined, color: style.colors['main1']),
            SizedBox(width: 10),
            Text('희망 광고비', style: TextStyle(fontSize: 15)),
            Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                f.format(campaign.pay),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              Text(
                ' 포인트',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              )
            ]))
          ]),
          SizedBox(height: 5),
          Row(children: [
            Icon(Icons.groups_outlined),
            SizedBox(width: 10),
            Text('신청자 수 / 모집 인원', style: TextStyle(fontSize: 15)),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(campaign.applicantCount.toString(),
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Text('명 / ',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Text(campaign.recruitCount.toString(),
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Text('명',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              ],
            ))
          ]),
        ]),
      ),
    );
  }
}
