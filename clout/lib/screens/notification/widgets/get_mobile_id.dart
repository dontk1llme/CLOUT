import 'dart:io';                       //Platform 사용을 위한 패키지
import 'package:flutter/services.dart'; //PlatformException 사용을 위한 패키지
import 'package:device_info/device_info.dart'; // 디바이스 정보 사용 패키지

Future<String> getMobileId() async {
  // DeviceInfoPlugin 클래스 생성
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // id 저장할 변수
  String id = '';
  try {
    // 플랫폼 확인
    if (Platform.isAndroid) {
      // 안드로이드의 경우 androidInfo를 이용 
      // 이때 await으로 데이터 받을때까지 대기를 해야함
      final AndroidDeviceInfo androidData = await deviceInfoPlugin.androidInfo;
      // 전달 받은 변수의 멤버 변수인 androidId가 고유 id이다.
      id = androidData.androidId;
    } else if (Platform.isIOS) {
      // iOS의 경우 iosInfo를 이용 
      // 이때 await으로 데이터 받을때까지 대기를 해야함
      final IosDeviceInfo iosData = await deviceInfoPlugin.iosInfo;
      // 전달 받은 변수의 멤버 변수인 identifierForVendor가 고유 id이다.
      id = iosData.identifierForVendor;
    }
  } on PlatformException {
    // 어떠한 원인으로 실패할 경우
    id = '';
  }
  // id 한번 출력해보고 
  print('id: $id');
  // 값 리턴
  return id;
}