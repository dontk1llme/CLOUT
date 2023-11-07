import 'package:get/get.dart';

class FourDigitsInputController extends GetxController {
  var correctPin;
  var inputPin;

  setCorrectPin(input) {
    correctPin = input;
    update();
  }

  setInputPin(input) {
    inputPin = input;
    update();
  }

}
