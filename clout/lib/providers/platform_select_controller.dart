import 'package:get/get.dart';

class PlatformSelectController extends GetxController {
  var platforms = [false, false, false];

  var id = ['', '', ''];
  var link = ['', '', ''];
  var followerCount = ['', '', ''];

  void setSelected(int index, bool multiAllowed) {
    var alreadyTrue;
    for (int i = 0; i < 3; i++) {
      if (platforms[i]) alreadyTrue = i;
    }
    if (!multiAllowed) {
      platforms = [false, false, false];
      if (alreadyTrue != null) {
        if (index != alreadyTrue) platforms[index] = !platforms[index];
      } else {
        if (index != alreadyTrue) platforms[index] = !platforms[index];
      }
    } else {
      platforms[index] = !platforms[index];
    }
    update();
    print(platforms);
  }

  setId(index, input) {
    id[index] = input;
    update();
  }

  setLink(index, input) {
    link[index] = input;
    update();
  }

  setFollowerCount(index, input) {
    followerCount[index] = input;
    update();
  }
}