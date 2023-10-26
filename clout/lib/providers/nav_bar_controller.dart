import 'package:get/get.dart';

class NavBarController extends GetxController {
  int tab = 0;

  void setTab(tabIndex) {
    tab = tabIndex;
    update();
  }
}
