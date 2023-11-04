import 'package:get/get.dart';

class RegionController extends GetxController {
  List<String> selectedRegions = [];

  void setSelectedRegions(input) {
    selectedRegions = input;
    update();
  }
}
