import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchDetailController extends GetxController {
  String minFee = '';
  String maxFee = '';
  String minFeeString = '';
  String maxFeeString = '';
  int minimumFolowers = 0;
  List<String>? selectedRegions;
  SfRangeValues ageRanges = SfRangeValues(0, 100);

  void setMinFee(input) {
    minFee = input;
    update();
  }

  void setMinFeeString(input) {
    minFeeString = input;
    update();
  }

  void setMaxFee(input) {
    maxFee = input;
    update();
  }

  void setMaxFeeString(input) {
    maxFeeString = input;
    update();
  }

  void setMinimumFollowers(input) {
    minimumFolowers = input;
    update();
  }

  void setSelectedRegions(input) {
    selectedRegions = input;
    update();
  }

  void setAgeRanges(input) {
    ageRanges = input;
    update();
    print(ageRanges);
  }
}
