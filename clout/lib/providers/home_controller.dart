import 'dart:convert';

import 'package:clout/hooks/item_api.dart';
import 'package:clout/type.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var campaignData = RxList<CampaignInfo>();
  var clouterData = RxList<ClouterInfo>();

  void fetchCampaigns() async {
    final ItemApi itemApi = ItemApi();
    await Future.delayed(Duration(seconds: 2));
    var response = await itemApi.getRequest(
        '/advertisement-service/v1/advertisements/', 'top10');
    var json = jsonDecode(response);

    List<dynamic> campaignsJson = json['top10CampaignList'];
    if (campaignsJson != null) {
      campaignData.value = campaignsJson.map((item) {
        var campaign = Campaign.fromJson(item['campaign']);
        var advertiserInfo = AdvertiserInfo.fromJson(item['advertiserInfo']);
        return CampaignInfo(
          campaign.campaignId,
          campaign.adPlatformList,
          campaign.price,
          campaign.details,
          campaign.deletedAt,
          campaign.title,
          campaign.adCategory,
          campaign.isPriceChangeable,
          campaign.isDeliveryRequired,
          campaign.numberOfRecruiter,
          campaign.numberOfApplicants,
          campaign.numberOfSelectedMembers,
          campaign.offeringDetails,
          campaign.sellingLink,
          campaign.applyStartDate,
          campaign.applyEndDate,
          campaign.minClouterAge,
          campaign.maxClouterAge,
          campaign.minFollower,
          advertiserInfo.companyInfo,
          advertiserInfo.address,
          advertiserInfo,
        );
      }).toList();
    } else {
      campaignData.value = [];
    }
  }

  // void fetchClouters() async {
  //   final ItemApi itemApi = ItemApi();
  //   await Future.delayed(Duration(seconds: 2));
  //   var response = await itemApi.getRequest(
  //       '/advertisement-service/v1/advertisements/', 'top10');
  //   var json = jsonDecode(response);

  //   List<dynamic> campaignsJson = json['top10CampaignList'];
  //   if (campaignsJson != null) {
  //     campaignData.value = campaignsJson.map((item) {
  //       var campaign = Campaign.fromJson(item['campaign']);
  //       var advertiserInfo = AdvertiserInfo.fromJson(item['advertiserInfo']);
  //       return CampaignInfo(
  //         campaign.campaignId,
  //         campaign.adPlatformList,
  //         campaign.price,
  //         campaign.details,
  //         campaign.deletedAt,
  //         campaign.title,
  //         campaign.adCategory,
  //         campaign.isPriceChangeable,
  //         campaign.isDeliveryRequired,
  //         campaign.numberOfRecruiter,
  //         campaign.numberOfApplicants,
  //         campaign.numberOfSelectedMembers,
  //         campaign.offeringDetails,
  //         campaign.sellingLink,
  //         campaign.applyStartDate,
  //         campaign.applyEndDate,
  //         campaign.minClouterAge,
  //         campaign.maxClouterAge,
  //         campaign.minFollower,
  //         advertiserInfo.companyInfo,
  //         advertiserInfo.address,
  //         advertiserInfo,
  //       );
  //     }).toList();
  //   } else {
  //     campaignData.value = [];
  //   }
  // }
}
