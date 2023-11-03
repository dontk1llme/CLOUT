import 'package:clout/providers/address_controller.dart';
import 'package:get/get.dart';

class AdvertiserRegisterController extends GetxController {
  var name;
  var phoneNumber;
  var id;
  var doubleId = 1;
  var password;
  var checkPassword;
  var buisnessName;
  var headName;
  var buisnessNumber;
  var obscured = true;

  final addressController = Get.put(AddressController());

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

  setBuisnessName(input) {
    buisnessName = input;
    update();
  }

  setHeadName(input) {
    headName = input;
    update();
  }

  setBuisnessNumber(input) {
    buisnessNumber = input;
    update();
  }

  setObscured() {
    obscured = !obscured;
    update();
  }

  canGoSecondPage() {
    if (buisnessName != null &&
        headName != null &&
        buisnessNumber != null &&
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
    print('담당자 이름');
    print(name);
    print('담당자 폰번호');
    print(phoneNumber);
    print('아이디');
    print(id);
    print('비밀번호');
    print(password);
    print('업체명');
    print(buisnessName);
    print('대표이름');
    print(headName);
    print('사업자등록번호');
    print(buisnessNumber);
    print('소재지');
    print(addressController.finalAddress);
  }
}
