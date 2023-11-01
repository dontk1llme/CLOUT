import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchDetailController extends GetxController {
  var platforms = [false, false, false];
  var minFee;
  var maxFee;
  var minFeeString = '0 원';
  var maxFeeString = '10억원';
  var minimumFollowers;
  var minimumFollowersString = '0';
  var selectedRegions = [];

  numbering(value, division) {
    return (value / division).floor();
  }

  feeConverter(input) {
    if (input.length > 1) {
      int number = int.parse(input);
      var numbers = [
        numbering(number, 100000000),
        numbering(number % 100000000, 10000),
        numbering(number % 10000, 1)
      ];
      var result = '';
      var unit = ["억", '만', ''];
      for (var i = 0; i < numbers.length; i++) {
        if (numbers[i] >= 1) {
          result += '${numbers[i]}${unit[i]} ';
        }
      }
      return result;
    } else {
      return input;
    }
  }

  followerConverter(input) {
    if (input.length > 1) {
      int number = int.parse(input);
      var numbers = [
        numbering(number, 100000000),
        numbering(number % 100000000, 10000),
        numbering(number % 10000, 1000),
        numbering(number % 1000, 1)
      ];
      var result = '';
      var unit = ["억", '만', '천', ''];
      for (var i = 0; i < numbers.length; i++) {
        if (numbers[i] >= 1) {
          result += '${numbers[i]}${unit[i]} ';
        }
      }
      return result;
    } else {
      return input;
    }
  }

  SfRangeValues ageRanges = SfRangeValues(0, 100);

  void setMinFee(input) {
    minFee = input;
    if (minFee != null) {
      setMinFeeString(feeConverter(input));
    }
    update();
  }

  void setMinFeeString(input) {
    minFeeString = '${input}원';
    update();
  }

  void setMaxFee(input) {
    maxFee = input;
    if (maxFee != null) {
      setMaxFeeString(feeConverter(input));
    }
    update();
  }

  void setMaxFeeString(input) {
    maxFeeString = '${input}원';
    update();
  }

  void setMinimumFollowers(input) {
    minimumFollowers = input;
    if (minimumFollowers != null) {
      setMinimumFollowersString(followerConverter(input));
    }
    update();
  }

  void setMinimumFollowersString(input) {
    minimumFollowersString = input;
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

  void setSelected(int index) {
    platforms[index] = !platforms[index];
    update();
  }
}
