import 'package:get/get.dart';

class HeaderController extends GetxController {
  int header = 0;
  var headerTitle = '채널명/메뉴명';

  void setHeader(headerType) {
    header = headerType;
    update();
  }

  void setHeaderTitle(title) {
    headerTitle = title;
    update();
  }

  void resetHeaderTitle() {
    headerTitle = "";
    // 여긴 일단 update() 안해놓음 비동기로 바로 반영될까봐
  }
}
