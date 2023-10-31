import 'package:get/get.dart';

class UserController extends GetxController {
  bool clouter = false;

  void setAdvertiser() {
    clouter = false;
    update();
  }

  void setClouter() {
    clouter = true;
    update();
  }
}
