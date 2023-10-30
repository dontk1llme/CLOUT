import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Campaign{
  int? campaignId;
  String? category;
  String? productName;
  String? endDate;
  int? recruitCount;
  int? pay;
  String? offeringItems;
  String? itemDetail;
  List<String>? selectedRegions;
  
}

class CampaignDetail extends StatelessWidget {
  CampaignDetail({super.key});

  var campaignId = Get.arguments;



  @override
  Widget build(BuildContext context) {
    return Text(campaignId.toString());
  }
}
