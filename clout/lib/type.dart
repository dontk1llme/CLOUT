class Campaign {
  int campaignId;
  final String adCategory;
  final String title; // '못골정미소 백미 5kg';
  final String price; // "1000 포인트";
  final String companyName; // '못골영농조합법인';
  final int numberOfSelectedMembers; // 채택된 인원
  final int numberOfRecruiter; // 모집 인원
  final List<String> adPlatformList;
  final int advertiserAvgstar;
  // String firstImg = 'assets/images/itemImage.jpg';

  Campaign({
    required this.campaignId,
    required this.adCategory,
    required this.title,
    required this.price,
    required this.companyName,
    required this.numberOfSelectedMembers,
    required this.numberOfRecruiter,
    required this.adPlatformList,
    required this.advertiserAvgstar,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    final campaignInfo = json['campaignInfo'];
    final companyInfo = json['companyInfo'];
    final advertiserInfo = json['advertiserInfo'];

    return Campaign(
      campaignId: campaignInfo['campaginId'],
      adCategory: campaignInfo['adCategory'],
      title: campaignInfo['title'],
      price: campaignInfo['price'],
      companyName: companyInfo['companyName'],
      numberOfSelectedMembers: campaignInfo['numberOfSelectedMembers'],
      numberOfRecruiter: campaignInfo['numberOfRecruiter'],
      adPlatformList: campaignInfo['adPlatformList'],
      advertiserAvgstar: advertiserInfo['advertiserAvgstar'],
    );
  }
}
