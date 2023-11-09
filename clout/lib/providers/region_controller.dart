import 'package:get/get.dart';

class RegionController extends GetxController {
  List<String?> selectedRegions = ['전체'];
  Map<String, String> enumString = {
    'ALL': '전체',
    'SEOUL': '서울',
    'BUSAN': '부산',
    'DAEGU': '대구',
    'INCHEON': '인천',
    'GWANGJU': '광주',
    'DAEJEON': '대전',
    'ULSAN': '울산',
    'SEJONG': '세종',
    'GYEONGGI': '경기',
    'GANGWON': '강원',
    'CHUNGBUK': '충북',
    'CHUNGNAM': '충남',
    'JEONBUK': '전북',
    'JEONNAM': '전남',
    'GYEONGBUK': '경북',
    'GYEONGNAM': '경남',
    'JEJU': '제주',
  };

  Map<String, String> stringEnum = {
    '전체': 'ALL',
    '서울': 'SEOUL',
    '부산': 'BUSAN',
    '대구': 'DAEGU',
    '인천': 'INCHEON',
    '광주': 'GWANGJU',
    '대전': 'DAEJEON',
    '울산': 'ULSAN',
    '세종': 'SEJONG',
    '경기': 'GYEONGGI',
    '강원': 'GANGWON',
    '충북': 'CHUNGBUK',
    '충남': 'CHUNGNAM',
    '전북': 'JEONBUK',
    '전남': 'JEONNAM',
    '경북': 'GYEONGBUK',
    '경남': 'GYEONGNAM',
    '제주': 'JEJU',
  };

  getEnum(input) {
    return stringEnum[input];
  }

  getString(input) {
    return enumString[input];
  }

  void setSelectedRegions(input) {
    selectedRegions = input;
    update();
  }

  void removeRegion(input) {
    selectedRegions.remove(input);
    update();
  }

  void addRegion(input) {
    selectedRegions.add(input);
    update();
  }
}
