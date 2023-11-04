import 'package:clout/providers/address_controller.dart';
import 'package:clout/providers/date_input_controller.dart';
import 'package:clout/providers/fee_controller.dart';
import 'package:clout/providers/follower_controller.dart';
import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/providers/region_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClouterModifyController extends GetxController {
  // 회원 정보 수정이므로 기존 정보 서버에서 받아와서 저장해야됨
  // 일단은 임시 데이터 설정
  var name = '박재민';
  var gender = '';
  var phoneNumber = '01055040749';
  var id = 'catbirdseat';
  var password;
  var checkPassword;
  var nickName = '박재민짱';
  var images = [
    'assets/images/clouterImage.jpg',
    'assets/images/itemImage.jpg',
    'assets/images/mone.png',
  ];
  // List<bool> selections = List.generate(12, (index) => false);
  List<bool> selections = [
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
  ];

  final dateController = Get.put(
    DateInputController(),
    tag: 'clouterModify',
  );
  final addressController = Get.put(
    AddressController(),
    tag: 'clouterModify',
  );
  final platformSlectController = Get.put(
    PlatformSelectController(),
    tag: 'clouterModify',
  );
  final followerController = Get.put(
    FollowerContoller(),
    tag: 'clouterModify',
  );
  final feeController = Get.put(
    FeeController(),
    tag: 'clouterModify',
  );
  final regionController = Get.put(
    RegionController(),
    tag: 'clouterModify',
  );

  setName(input) {
    name = input;
    update();
  }

  setGender(input) {
    gender = input;
    update();
  }

  setPhoneNumber(input) {
    phoneNumber = input;
    update();
  }

  setId(input) {
    id = input;
  }

  setPassword(input) {
    password = input;
  }

  setCheckPassword(input) {
    checkPassword = input;
  }

  setNickName(input) {
    nickName = input;
  }

  setImages(input) {
    images = input;
    print(images);
  }

  setSelection(index) {
    if (index == 0) {
      selections = List.generate(12, (index) => false);
      selections[index] = !selections[index];
    } else {
      selections[0] = false;
      selections[index] = !selections[index];
    }
    update();
  }

  canGoSecondPage() {
    if (name != null &&
        DateFormat('yyyy.MM.dd').format(dateController.selectedDate) !=
            DateFormat('yyyy.MM.dd').format(DateTime.now()) &&
        phoneNumber != null &&
        addressController.daumAddress != '주소 검색' &&
        addressController.detailAddress != null) {
      return true;
    } else {
      return false;
    }
  }

  canGoThirdPage() {
    if (nickName != null &&
        id != null &&
        password != null &&
        checkPassword != null) {
      if (password == checkPassword) {
        return 1;
      } else {
        return 0;
      }
    } else {
      return -1;
    }
  }

  printAll() {
    print('이름');
    print(name);
    print('생년월일');
    print(dateController.selectedDate);
    print('휴대폰 번호');
    print(phoneNumber);
    print('주소');
    print(DateFormat('yyyy.MM.dd').format(dateController.selectedDate));
    print('아이디');
    print(id);
    print('비번');
    print(password);
    print('비번확인');
    print(checkPassword);
    print('닉네임');
    print(nickName);
    print('사진들');
    print(images);
    print('광고 가능 플랫폼');
    print(platformSlectController.platforms);
    print('각 아이디');
    print(platformSlectController.id);
    print('각 링크');
    print(platformSlectController.link);
    print('각 팔로워 수');
    print(platformSlectController.followerCount);
    print('최소 희망 광고비');
    print(feeController.pay);
    print('희망 카테고리');
    print(selections);
    print('희망 지역');
    print(regionController.selectedRegions);
  }
}
