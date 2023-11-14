class AdCategoryTranslator {
  static String translateAdCategory(String adCategory) {
    Map<String, String> adCategoryTranslations = {
      "ALL": "전체",
      "FASHION_BEAUTY": "패션/뷰티",
      "HEALTH_LIFESTYLE": "건강/생활",
      "TRAVEL_LEISURE": "여행/레저",
      "PARENTING": "육아",
      "ELECTRONICS": "전자제품",
      "FOOD": "음식",
      "VISIT_EXPERIENCE": "방문/체험",
      "PETS": "반려동물",
      "GAMES": "게임",
      "ECONOMY_BUSINESS": "경제/사업",
      "OTHERS": "기타",
    };

    return adCategoryTranslations[adCategory] ?? "";
  }

  static String translateRegion(String region) {
    Map<String, String> regionTranslations = {
      "ALL": "전국",
      "SEOUL": "서울",
      "BUSAN": "부산",
      "DAEGU": "대구",
      "INCHEON": "인천",
      "GWANGJU": "광주",
      "DAEJEON": "대전",
      "ULSAN": "울산",
      "SEJONG": "세종",
      "GYEONGGI": "경기",
      "GANGWON": "강원",
      "CHUNGBUK": "충북",
      "CHUNGNAM": "충남",
      "JEONBUK": "전북",
      "JEONNAM": "전남",
      "GYEONGBUK": "경북",
      "GYEONGNAM": "경남",
      "JEJU": "제주",
    };

    return regionTranslations[region] ?? "";
  }
}
