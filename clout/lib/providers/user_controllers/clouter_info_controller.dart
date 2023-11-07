import 'package:clout/providers/address_controller.dart';
import 'package:clout/providers/date_input_controller.dart';
import 'package:clout/providers/fee_controller.dart';
import 'package:clout/providers/follower_controller.dart';
import 'package:clout/providers/four_digits_input_controller.dart';
import 'package:clout/providers/image_picker_controller.dart';
import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/providers/region_controller.dart';
import 'package:clout/providers/user_controllers/clouter_controller.dart';
import 'package:clout/type.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClouterInfoController extends GetxController {
  var name;
  var gender;
  var phoneNumber;
  var id;
  var password;
  var checkPassword;
  var nickName;
  var images;
  List<bool> selections = List.generate(12, (index) => false);
  var doubleId = 1;
  var obscured = true;
  var phoneNumberVerified;

  var clouter;

  final clouterController = Get.find<ClouterController>();
  var fourDigitsInputController;
  var addressController;
  var platformSelectController;
  var followerController;
  var feeController;
  var regionController;
  var dateController;
  var imagePickerController;

  runOtherControllers() {
    fourDigitsInputController = Get.put(
      FourDigitsInputController(),
      tag: clouterController.controllerTag,
    );
    addressController = Get.put(
      AddressController(),
      tag: clouterController.controllerTag,
    );
    platformSelectController = Get.put(
      PlatformSelectController(),
      tag: clouterController.controllerTag,
    );
    followerController = Get.put(
      FollowerContoller(),
      tag: clouterController.controllerTag,
    );
    feeController = Get.put(
      FeeController(),
      tag: clouterController.controllerTag,
    );
    regionController = Get.put(
      RegionController(),
      tag: clouterController.controllerTag,
    );
    dateController = Get.put(
      DateInputController(),
      tag: clouterController.controllerTag,
    );
    imagePickerController = Get.put(
      ImagePickerController(),
      tag: clouterController.controllerTag,
    );
  }

  var categories = [
    'ALL',
    'FASHION_BEAUTY',
    'HEALTH_LIVING',
    'TRAVEL_LEISURE',
    'PARENTING',
    'ELECTRONICS',
    'FOOD',
    'VISIT_EXPERIENCE',
    'PET',
    'GAME',
    'FINANCE_BUSINESS',
    'ETC'
  ];

  setClouter() {
    List<ChannelList> channelList = [];
    for (int i = 0; i < 3; i++) {
      if (platformSelectController!.platforms[i]) {
        ChannelList channel = ChannelList(
            platformSelectController!.id[i],
            i == 0
                ? 'INSTAGRAM'
                : id == 1
                    ? 'TIKTOK'
                    : 'YOUTUBE',
            platformSelectController!.link[i],
            platformSelectController!.followerCount[i]);
        channelList.add(channel);
      }
    }

    List<String> categoryList = [];
    for (int i = 0; i < 12; i++) {
      if (selections[i]) {
        categoryList.add(categories[i]);
      }
    }

    Address address = Address(
      addressController!.zipCode,
      addressController!.daumAddress,
      addressController!.detailAddress,
    );

    clouter = Clouter(
        id,
        password,
        nickName,
        name,
        DateFormat('yyyy.MM.dd').format(dateController!.selectedDate),
        phoneNumber,
        channelList,
        // feeController!.minFee,
        categoryList,
        regionController!.selectedRegions,
        address);
    update();
  }

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

  setDoubleId(input) {
    //defulat 1
    //가능하면 2
    //중복이면 3
    //지금은 편의상 중복 아니라고 함
    doubleId = input;
    update();
  }

  setObscured() {
    obscured = !obscured;
    update();
  }

  setPhoneNumberVerified(input) {
    phoneNumberVerified = input;
    update();
  }

  canGoSecondPage() {
    if (name != null &&
        DateFormat('yyyy.MM.dd').format(dateController!.selectedDate) !=
            DateFormat('yyyy.MM.dd').format(DateTime.now()) &&
        phoneNumber != null &&
        addressController!.daumAddress != '주소 검색' &&
        addressController!.detailAddress != null) {
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
    print(dateController!.selectedDate);
    print('휴대폰 번호');
    print(phoneNumber);
    print('주소');
    print(DateFormat('yyyy.MM.dd').format(dateController!.selectedDate));
    print('아이디');
    print(id);
    print('비번');
    print(password);
    print('비번확인');
    print(checkPassword);
    print('닉네임');
    print(nickName);
    print('사진들');
    // print(images);
    print('광고 가능 플랫폼');
    print(platformSelectController!.platforms);
    print('각 아이디');
    print(platformSelectController!.id);
    print('각 링크');
    print(platformSelectController!.link);
    print('각 팔로워 수');
    print(platformSelectController!.followerCount);
    print('최소 희망 광고비');
    print(feeController!.pay);
    print('희망 카테고리');
    print(selections);
    print('희망 지역');
    print(regionController!.selectedRegions);
  }
}
