import 'dart:convert';

class Address {
  String? zipCode;
  String? mainAddress;
  String? detailAddress;

  Address(this.zipCode, this.mainAddress, this.detailAddress);

  Map<String, dynamic> toJson() => {
        'zipCode': zipCode,
        'mainAddress': mainAddress,
        'detailAddress': detailAddress,
      };
}

class CompanyInfo {
  String? companyName;
  String? regNum;
  String? ceoName;
  String? managerName;
  String? managerPhoneNumber;

  CompanyInfo(this.companyName, this.regNum, this.ceoName, this.managerName,
      this.managerPhoneNumber);

  Map<String, dynamic> toJson() => {
        'companyName': companyName,
        'regNum': regNum,
        'ceoName': ceoName,
        'managerName': managerName,
        'managerPhoneNumber': managerPhoneNumber,
      };
}

class Advertiser {
  String? userId;
  String? pwd;
  Address? address;
  CompanyInfo? companyInfo;
  int? advertiserAvgstar;

  Advertiser(this.userId, this.pwd, this.address, this.companyInfo,
      this.advertiserAvgstar);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'pwd': pwd,
        'address': address,
        'companyInfo': companyInfo,
        'advertiserAvgstar': advertiserAvgstar,
      };
}

// 아이디 중복 체크
class CheckDuplicated {
  bool checkValue;

  CheckDuplicated({required this.checkValue});

  factory CheckDuplicated.fromJson(Map<String, dynamic> json) {
    return CheckDuplicated(checkValue: json['checkValue']);
  }
}

class ChannelList {
  String name;
  String platform;
  String link;
  String followerScale;

  ChannelList(this.name, this.platform, this.link, this.followerScale);

  Map<String, dynamic> toJson() => {
        'name': name,
        'platform': platform,
        'link': link,
        'followerScale': followerScale,
      };
}

class HopeCost {
  int minCost;
  int maxCost;

  HopeCost(this.minCost, this.maxCost);

  Map<String, dynamic> toJson() => {
        'minCost': minCost,
        'maxCost': maxCost,
      };
}

class Clouter {
  String userId;
  String pwd;
  String nickName;
  String name;
  String birthday;
  // String age; // 생일 정보를 받아서 age를 따로 받을 필요가 있나 문의
  String phoneNumber;
  List<ChannelList> channelList; // 이거 followerScale 숫자로 받을 수 있는지 문의
  // HopeCost hopeCost; // 이거 최소 최대가 아니라 최솟값만 받도록 조정
  // bool negoable; // 이건 캠페인 아닌가?
  List<String> categoryList;
  List<String?> regionList;
  Address address;

  Clouter(
    this.userId,
    this.pwd,
    this.nickName,
    this.name,
    this.birthday,
    this.phoneNumber,
    this.channelList,
    // this.hopeCost,
    // this.negoable,
    this.categoryList,
    this.regionList,
    this.address,
  );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'pwd': pwd,
        'nickName': nickName,
        'name': name,
        'birthday': birthday,
        'phoneNumber': phoneNumber,
        'channelList': channelList,
        // 'hopeCost': hopeCost,
        // 'negoable': negoable,
        'categoryList': categoryList,
        'regionList': regionList,
        'address': address,
      };
}

class Campaign {
  int campaignId;
  String adCategory;
  String title;
  String price;
  String details;
  String companyName;
  int numberOfSelectedMembers;
  int numberOfRecruiter;
  int numberOfApplicants;
  List<String> adPlatformList;
  int advertiserAvgstar;
  String deletedAt;
  bool isPriceChangeable;
  bool isDeliveryRequired;
  String offeringDetails;
  String sellingLink;
  String applyStartDate;
  String applyEndDate;
  int minClouterAge;
  int maxClouterAge;
  int minFollower;
  // String firstImg = 'assets/images/itemImage.jpg';

  Campaign({
    required this.campaignId,
    required this.adCategory,
    required this.title,
    required this.price,
    required this.details,
    required this.companyName,
    required this.numberOfSelectedMembers,
    required this.numberOfRecruiter,
    required this.numberOfApplicants,
    required this.adPlatformList,
    required this.advertiserAvgstar,
    required this.deletedAt,
    required this.isPriceChangeable,
    required this.isDeliveryRequired,
    required this.offeringDetails,
    required this.sellingLink,
    required this.applyStartDate,
    required this.applyEndDate,
    required this.minClouterAge,
    required this.maxClouterAge,
    required this.minFollower,
    // required this.firstImg,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      campaignId: json['campaignId'],
      adCategory: json['adCategory'],
      title: json['title'],
      price: json['price'],
      details: json['details'],
      companyName: json['companyName'],
      numberOfSelectedMembers: json['numberOfSelectedMembers'],
      numberOfRecruiter: json['numberOfRecruiter'],
      numberOfApplicants: json['numberOfApplicants'],
      adPlatformList: json['adPlatformList'],
      advertiserAvgstar: json['advertiserAvgstar'],
      deletedAt: json['deletedAt'],
      isPriceChangeable: json['isPriceChangeable'],
      isDeliveryRequired: json['isDeliveryRequired'],
      offeringDetails: json['offeringDetails'],
      sellingLink: json['sellingLink'],
      applyStartDate: json['applyStartDate'],
      applyEndDate: json['applyEndDate'],
      minClouterAge: json['minClouterAge'],
      maxClouterAge: json['maxClouterAge'],
      minFollower: json['minFollower'],
      // firstImg: json['firstImg'],
    );
  }
}
