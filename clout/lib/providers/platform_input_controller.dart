import 'package:get/get.dart';

class PlatformInputController extends GetxController {
  var instagramLink;
  var instagramId;
  var instagramFollowerCount;
  var tiktokLink;
  var tiktokId;
  var tiktokFollowerCount;
  var youtubeLink;
  var youtubeId;
  var youtubeFollowerCount;

  void setInstagramLink(input) {
    instagramLink = input;
    update();
  }

  void setInstagramId(input) {
    instagramId = input;
    update();
  }

  void setInstagramFollowerCount(input) {
    instagramFollowerCount = input;
    update();
  }

  void setTiktokLink(input) {
    tiktokLink = input;
    update();
  }

  void setTiktokId(input) {
    tiktokId = input;
    update();
  }

  void setTiktokFollowerCount(input) {
    tiktokFollowerCount = input;
    update();
  }

  void setYoutubeLink(input) {
    youtubeLink = input;
    update();
  }

  void setYoutubeId(input) {
    youtubeId = input;
    update();
  }

  void setYoutubeFollowerCount(input) {
    youtubeFollowerCount = input;
    update();
  }
}
