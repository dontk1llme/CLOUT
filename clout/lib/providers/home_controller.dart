import 'dart:convert';

import 'package:clout/hooks/apis/normal_api.dart';
import 'package:clout/hooks/item_api.dart';
import 'package:clout/type.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var campaignData = RxList<CampaignInfo>();
  var clouterData = RxList<ClouterInfo>();

  void fetchCampaigns() async {
    final NormalApi api = NormalApi();
    await Future.delayed(Duration(seconds: 2));
    var response = await api.getRequest(
        '/advertisement-service/v1/advertisements/', 'top10');
    // reponse = {'statusCode' : 값, 'body' : 값};

    var json = jsonDecode(response['body']);

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

  void fetchClouters() async {
    final NormalApi api = NormalApi();
    await Future.delayed(Duration(seconds: 2));
    var response =
        await api.getRequest('/member-service/v1/clouters/', 'top10');
    var json = jsonDecode(response['body']);

    List<dynamic> cloutersJson = json['clouters'];
    if (cloutersJson != null) {
      clouterData.value = cloutersJson.map((item) {
        var clouterInfo = ClouterInfo.fromJson(item);
        return ClouterInfo(
          clouterInfo.clouterId,
          clouterInfo.userId,
          clouterInfo.avgScore,
          // clouterInfo.contractCount, // 💥 계약한 광고 건수 수정
          clouterInfo.role,
          clouterInfo.nickName,
          clouterInfo.name,
          clouterInfo.birthday,
          clouterInfo.age,
          clouterInfo.phoneNumber,
          clouterInfo.channelList,
          clouterInfo.minCost,
          clouterInfo.categoryList,
          clouterInfo.regionList,
          clouterInfo.address,
        );
      }).toList();
    } else {
      clouterData.value = [];
    }
  }
}
