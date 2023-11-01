import 'package:get/get.dart';

class RegionController extends GetxController {
  var selectedRegions = [];

  void setSelectedRegions(input) {
    selectedRegions = input;
    update();
  }
}
