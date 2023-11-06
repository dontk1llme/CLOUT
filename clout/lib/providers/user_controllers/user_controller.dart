import 'package:get/get.dart';

class UserController extends GetxController {
  int user = 0;
  var userId;

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
}
