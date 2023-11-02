import 'package:clout/providers/age_controller.dart';
import 'package:clout/providers/fee_controller.dart';
import 'package:clout/providers/follower_controller.dart';
import 'package:clout/providers/platform_select_controller.dart';
import 'package:clout/providers/region_controller.dart';
import 'package:get/get.dart';

class CampaignRegisterController extends GetxController {
  var category,
      productName,
      recruitCount = 1,
      offeringItems,
      itemDetail,
      images,
      signature;

  final ageController = Get.put(AgeController());
  final platformController = Get.put(PlatformSelectController());
  final payController = Get.put(FeeController());
  final followerController = Get.put(FollowerContoller());
  final regionController = Get.put(RegionController());

  setCategory(input) {
    category = input;
    update();
  }

  setProductName(input) {
    productName = input;
    update();
  }

  setRecruitCount(input) {
    recruitCount = input;
    update();
  }

  setOfferingItems(input) {
    offeringItems = input;
    update();
  }

  setItemDetail(input) {
    itemDetail = input;
    update();
  }

  setImages(input) {
    images = input;
    update();
    print(images);
  }

  setSignature(input) {
    signature = input;

    update();
  }

  printAll() {
    print(category);
    print(productName);
    print(recruitCount);
    print(offeringItems);
    print(itemDetail);
    print(images);
    print(signature);
    print(ageController.ageRanges.start);
    print(ageController.ageRanges.end);
    print(payController.pay);
    print(payController.payString);
    print(platformController.platforms);
    print(followerController.minimumFollowers);
    print(regionController.selectedRegions);
  }
}
