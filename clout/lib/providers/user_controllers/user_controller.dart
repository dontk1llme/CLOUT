import 'package:get/get.dart';
import 'package:clout/type.dart';

class UserController extends GetxController {
  int user = 1;
  var userId = '2';
  var password;

  var userInfo;
  var userLogin;

  void setAdvertiser() {
    user = 1;
    update();
  }

  void setClouter() {
    user = -1;
    update();
  }

  void setGuest() {
    user = 0;
    update();
  }

  setUserId(input) {
    userId = input;
    update();
  }

  setPassword(input) {
    password = input;
    update();
  }

  setUserInfo() {
    userInfo = Login(
        // user,
        userId,
        password);
    print('유저인포 업데이트');
    update();
  }

  setUserLogin(input) {
    userLogin = input;
    update();
  }
}
