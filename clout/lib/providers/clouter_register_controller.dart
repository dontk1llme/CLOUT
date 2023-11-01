import 'package:get/get.dart';

class ClouterRegisterController extends GetxController {
  var name;
  var gender;
  var birthday;
  var phoneNumber;
  var address;

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
    address = input();
    update();
  }
}
