import 'package:clout/providers/age_controller.dart';
import 'package:clout/providers/fee_controller.dart';
import 'package:clout/providers/follower_controller.dart';
import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/providers/region_controller.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  int tab = 0;

  void setTab(tabIndex) {
    tab = tabIndex;
    update();
  }

  final platformController = Get.put(PlatformSelectController());
  final feeController = Get.put(FeeController());
  final followerContoller = Get.put(FollowerContoller());
  final ageController = Get.put(AgeController());
  final regionController = Get.put(RegionController());

  void resetSearchDetail() {
    Get.delete<PlatformSelectController>(force: true);
    Get.delete<FeeController>(force: true);
    Get.delete<FollowerContoller>(force: true);
    Get.delete<AgeController>(force: true);
    Get.delete<RegionController>(force: true);
  }
}
