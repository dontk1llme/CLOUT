import 'package:clout/type.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:intl/intl.dart';

// widgets
import 'package:clout/utilities/category_translator.dart';
import 'package:clout/widgets/common/nametag.dart';

class CampaignDetailInfoBox extends StatelessWidget {
  final CampaignInfo campaignInfo;
  final AdvertiserInfo advertiserInfo;

  CampaignDetailInfoBox(
      {super.key, required this.campaignInfo, required this.advertiserInfo});

  var f = NumberFormat('###,###,###,###');
  // final AdCategoryTranslator categoryTranslator = AdCategoryTranslator();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: style.colors['gray']!),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          NameTag(
              title: AdCategoryTranslator.translateAdCategory(
                  campaignInfo.adCategory!)),
          SizedBox(height: 10),
          Text(
            campaignInfo.title!,
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
                    advertiserInfo.companyInfo!.companyName!,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 2),
                      Text(advertiserInfo.advertiserAvgStar.toString(),
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
                // campaignInfo.adPlatformList,
                '',
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
                '${campaignInfo.applyStartDate} ~ ${campaignInfo.applyEndDate}',
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
                f.format(campaignInfo.price),
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
                Text(campaignInfo.numberOfSelectedMembers.toString(),
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Text('명 / ',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Text(campaignInfo.numberOfRecruiter.toString(),
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
