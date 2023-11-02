import 'package:clout/providers/platform_select_controller.dart';
import 'package:get/get.dart';

class ClouterRegisterController extends GetxController {
  var name;
  var gender;
  var birthday;
  var phoneNumber;
  var address;
  var id;
  var password;
  var checkPassword;
  var nickName;
  var images;

  final platformInputController = Get.put(PlatformSelectController());

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

  setAddress(input) {
    address = input;
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

  printAll() {
    print('이름');
    print(name);
    print('생년월일');
    print(birthday);
    print('휴대폰 번호');
    print(phoneNumber);
    print('주소');
    print(address);
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
  }
}
