import 'package:get/get.dart';
import 'package:clout/type.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  int user = 0;
  var userId;
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

  setUserInfo(){
    userInfo = Login(
      // user,
      userId,
      password
    );
    print('유저인포 업데이트');
    update();
  }

  setUserLogin(input){
    userLogin = input;
    update();
  }
}
