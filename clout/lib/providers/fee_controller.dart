import 'package:get/get.dart';

class FeeController extends GetxController {
  var minFee;
  var maxFee;
  var minFeeString = '0 원';
  var maxFeeString = '10억원';
  var pay;
  var payString = '0 원';

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

  setPay(input) {
    pay = input;
    if (pay != null) {
      setPayString(feeConverter(input));
    }
    update();
  }

  setPayString(input) {
    payString = '${input}원';
    update();
  }
}
