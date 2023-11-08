import 'package:get/get.dart';

class RegionController extends GetxController {
  List<String?> selectedRegions = ['전체'];

  void setSelectedRegions(input) {
    selectedRegions = input;
    update();
  }

  void removeRegion(input) {
    selectedRegions.remove(input);
    update();
  }

  void addRegion(input) {
    selectedRegions.add(input);
    update();
  }
}
