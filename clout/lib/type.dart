import 'dart:convert';

class Address {
  String zipCode;
  String mainAddress;
  String detailAddress;

  Address(this.zipCode, this.mainAddress, this.detailAddress);

  Map<String, dynamic> toJson() => {
        'zipCode': zipCode,
        'mainAddress': mainAddress,
        'detailAddress': detailAddress,
      };

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      json['zipCode'],
      json['mainAddress'],
      json['detailAddress'],
    );
  }
}

class CompanyInfo {
  String companyName;
  String regNum;
  String ceoName;
  String managerName;
  String managerPhoneNumber;

  CompanyInfo(this.companyName, this.regNum, this.ceoName, this.managerName,
      this.managerPhoneNumber);

  Map<String, dynamic> toJson() => {
        'companyName': companyName,
        'regNum': regNum,
        'ceoName': ceoName,
        'managerName': managerName,
        'managerPhoneNumber': managerPhoneNumber,
      };

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      json['companyName'],
      json['regNum'],
      json['ceoName'],
      json['managerName'],
      json['managerPhoneNumber'],
    );
  }
}

class Advertiser {
  String userId;
  String pwd;
  Address address;
  CompanyInfo companyInfo;

  Advertiser(this.userId, this.pwd, this.address, this.companyInfo);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'pwd': pwd,
        'address': address,
        'companyInfo': companyInfo,
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

// 💥 다정이가 title 추가하면 확인 후 추가하기
class Campaign {
  int? campaignId;
  List<String>? adPlatformList;
  int? price;
  String? details;
  String? deletedAt;
  String? adCategory;
  bool? isPriceChangeable;
  bool? isDeliveryRequired;
  int? numberOfRecruiter;
  int? numberOfApplicants;
  int? numberOfSelectedMembers;
  String? offeringDetails;
  String? sellingLink;
  String? applyStartDate;
  String? applyEndDate;
  int? minClouterAge;
  int? maxClouterAge;
  int? minFollower;
  CompanyInfo? companyInfo;
  Address? address;
  AdvertiserInfo? advertiserInfo;

  // String firstImg = 'assets/images/itemImage.jpg';

  Campaign({
    required this.campaignId,
    required this.adPlatformList,
    required this.price,
    required this.details,
    required this.deletedAt,
    required this.adCategory,
    required this.isPriceChangeable,
    required this.isDeliveryRequired,
    required this.numberOfRecruiter,
    required this.numberOfApplicants,
    required this.numberOfSelectedMembers,
    required this.offeringDetails,
    required this.sellingLink,
    required this.applyStartDate,
    required this.applyEndDate,
    required this.minClouterAge,
    required this.maxClouterAge,
    required this.minFollower,
    required this.companyInfo,
    required this.address,
    required this.advertiserInfo,
    // required this.firstImg,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      campaignId: json['campaignId'],
      adPlatformList: json['adPlatformList'] != null
          ? List<String>.from(json['adPlatformList'])
          : null,
      price: json['price'],
      details: json['details'],
      deletedAt: json['deletedAt'],
      adCategory: json['adCategory'],
      isPriceChangeable: json['isPriceChangeable'],
      isDeliveryRequired: json['isDeliveryRequired'],
      numberOfRecruiter: json['numberOfRecruiter'],
      numberOfApplicants: json['numberOfApplicants'],
      numberOfSelectedMembers: json['numberOfSelectedMembers'],
      offeringDetails: json['offeringDetails'],
      sellingLink: json['sellingLink'],
      applyStartDate: json['applyStartDate'],
      applyEndDate: json['applyEndDate'],
      minClouterAge: json['minClouterAge'],
      maxClouterAge: json['maxClouterAge'],
      minFollower: json['minFollower'],
      companyInfo: json['companyInfo'] != null
          ? CompanyInfo.fromJson(json['companyInfo'])
          : null,
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      advertiserInfo: json['advertiserInfo'] != null
          ? AdvertiserInfo.fromJson(json['advertiserInfo'])
          : null,
    );
  }
}

class AdvertiserInfo {
  int? advertiserId;
  String? userId;
  int? totalPoint;
  String? role;
  int? advertiserAvgStar;
  Address? address;
  CompanyInfo? companyInfo;

  AdvertiserInfo(
    this.advertiserId,
    this.userId,
    this.totalPoint,
    this.role,
    this.advertiserAvgStar,
    this.address,
    this.companyInfo,
  );

  Map<String, dynamic> toJson() => {
        'advertiserId': advertiserId,
        'userId': userId,
        'totalPoint': totalPoint,
        'role': role,
        'advertiserAvgStar': advertiserAvgStar,
        'address': address,
        'companyInfo': companyInfo,
      };

  factory AdvertiserInfo.fromJson(Map<String, dynamic> json) {
    return AdvertiserInfo(
      json['advertiserId'],
      json['userId'],
      json['totalPoint'],
      json['role'],
      json['advertiserAvgStar'],
      json['address'],
      json['companyInfo'],
    );
  }
}
