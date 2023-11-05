import 'package:clout/providers/fee_controller.dart';
import 'package:get/get.dart';

class CampaginApplyController extends GetxController {
  var oneSay;
  var agreed = false;

  setOneSay(input) {
    oneSay = input;
    update();
  }

  setAgreed(input) {
    agreed = input;
    update();
  }

  final feeController = Get.put(FeeController(), tag: 'campaignApply');
}
