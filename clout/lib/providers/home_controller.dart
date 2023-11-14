import 'dart:convert';

import 'package:clout/hooks/apis/normal_api.dart';
import 'package:clout/type.dart';
import 'package:clout/utilities/category_translator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var campaignData = RxList<CampaignInfo>();
  var clouterData = RxList<ClouterInfo>();
  var isLoading = true;

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
        isLoading = false;
        return CampaignInfo(
          campaign.campaignId,
          campaign.adPlatformList,
          campaign.price,
          campaign.details,
          campaign.deletedAt,
          campaign.title,
          AdCategoryTranslator.translateAdCategory(campaign.adCategory!),
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
    update();
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
          clouterId: clouterInfo.clouterId,
          userId: clouterInfo.userId,
          avgScore: clouterInfo.avgScore,
          // clouterInfo.contractCount, // 💥 계약한 광고 건수 수정
          role: clouterInfo.role,
          nickName: clouterInfo.nickName,
          name: clouterInfo.name,
          birthday: clouterInfo.birthday,
          age: clouterInfo.age,
          phoneNumber: clouterInfo.phoneNumber,
          channelList: clouterInfo.channelList,
          minCost: clouterInfo.minCost,
          categoryList: clouterInfo.categoryList,
          regionList: clouterInfo.regionList,
          address: clouterInfo.address,
          countOfContract: clouterInfo.countOfContract,
          // imageResponses: clouterInfo.imageResponses,
        );
      }).toList();
    } else {
      clouterData.value = [];
    }
    update();
  }
}
