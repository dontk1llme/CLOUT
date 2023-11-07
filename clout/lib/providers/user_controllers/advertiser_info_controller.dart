import 'package:clout/providers/address_controller.dart';
import 'package:clout/providers/user_controllers/advertiser_controller.dart';
import 'package:clout/type.dart';
import 'package:get/get.dart';

class AdvertiserInfoController extends GetxController {
  var name;
  var phoneNumber;
  var id;
  var doubleId = 1;
  var password;
  var checkPassword;
  var businessName;
  var headName;
  var businessNumber;
  var obscured = true;

  var advertiser;

  final advertiserController = Get.find<AdvertiserController>();

  var addressController;
  runOtherControllers() {
    addressController = Get.put(
      AddressController(),
      tag: advertiserController.controllerTag,
    );
  }

  setAdvertiser() {
    advertiser = Advertiser(
      id,
      password,
      Address(addressController.zipCode, addressController.daumAddress,
          addressController.detailAddress),
      CompanyInfo(businessName, businessNumber, headName, name, phoneNumber),
    );
    update();
  }

  setName(input) {
    name = input;
    update();
  }

  setPhoneNumber(input) {
    phoneNumber = input;
    update();
  }

  setId(input) {
    id = input;
    update();
  }

  setDoubleId() {
    //없을 때 0
    //중복이면 1
    //가능하면 2
    //지금은 편의상 중복 아니라고 함
    doubleId = 2;
    update();
  }

  setPassword(input) {
    password = input;
    update();
  }

  setCheckPassword(input) {
    checkPassword = input;
    update();
  }

  setBusinessName(input) {
    businessName = input;
    update();
  }

  setHeadName(input) {
    headName = input;
    update();
  }

  setBusinessNumber(input) {
    businessNumber = input;
    update();
  }

  setObscured() {
    obscured = !obscured;
    update();
  }

  canGoSecondPage() {
    if (businessName != null &&
        headName != null &&
        businessNumber != null &&
        addressController.finalAddress != '') {
      return true;
    } else {
      return false;
    }
  }

  canGoThirdPage() {
    if (name != null &&
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
    // print('담당자 이름');
    // print(name);
    // print('담당자 폰번호');
    // print(phoneNumber);
    // print('아이디');
    // print(id);
    // print('비밀번호');
    // print(password);
    // print('업체명');
    // print(businessName);
    // print('대표이름');
    // print(headName);
    // print('사업자등록번호');
    // print(businessNumber);
    // print('소재지');
    // print(addressController.finalAddress);
    print('아이디');
    print(advertiser?.userId);
    print('비밀번호');
    print(advertiser?.pwd);
    print('지역코드');
    print(advertiser?.address.zipCode);
    print('소재지');
    print(advertiser?.address.mainAddress);
    print('상세주소');
    print(advertiser?.address.detailAddress);
    print('회사 이름');
    print(advertiser?.companyInfo.companyName);
    print('대표 이름');
    print(advertiser?.companyInfo.ceoName);
    print('사업자등록번호');
    print(advertiser?.companyInfo.regNum);
    print('담당자 이름');
    print(advertiser?.companyInfo.managerName);
    print('담당자 폰번호');
    print(advertiser?.companyInfo.managerPhoneNumber);
  }
}
