import 'package:clout/providers/age_controller.dart';
import 'package:clout/providers/fee_controller.dart';
import 'package:clout/providers/follower_controller.dart';
import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/providers/region_controller.dart';
import 'package:get/get.dart';

class SearchDetailController extends GetxController {
  final platformSelectController = Get.put(
    PlatformSelectController(),
    tag: 'searchDetail',
  );
  final ageController = Get.put(
    AgeController(),
    tag: 'searchDetail',
  );
  final followerController = Get.put(
    FollowerController(),
    tag: 'searchDetail',
  );
  final payController = Get.put(
    FeeController(),
    tag: 'searchDetail',
  );
  final regionController = Get.put(
    RegionController(),
    tag: 'searchDetail',
  );
}
