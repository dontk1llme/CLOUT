import 'package:clout/providers/address_controller.dart';
import 'package:clout/providers/fee_controller.dart';
import 'package:clout/providers/follower_controller.dart';
import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/providers/region_controller.dart';
import 'package:get/get.dart';

class ClouterRegisterController extends GetxController {
  var name;
  var gender;
  var birthday;
  var phoneNumber;
  var id;
  var password;
  var checkPassword;
  var nickName;
  var images;
  List<bool> selections = List.generate(12, (index) => false);

  final addressController = Get.put(AddressController());
  final platformSlectController = Get.put(PlatformSelectController());
  final followerController = Get.put(FollowerContoller());
  final feeController = Get.put(FeeController());
  final regionController = Get.put(RegionController());

  setName(input) {
    name = input;
    update();
  }

  setGender(input) {
    gender = input;
    update();
  }

  setBirthday(input) {
    birthday = input;
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

  canGoSecondPage() {
    if (name != null &&
        birthday != null &&
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

  printAll() {
    print('이름');
    print(name);
    print('생년월일');
    print(birthday);
    print('휴대폰 번호');
    print(phoneNumber);
    print('주소');
    print(addressController.finalAddress);
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
