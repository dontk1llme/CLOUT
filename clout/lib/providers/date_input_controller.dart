import 'package:get/get.dart';

class DateInputController extends GetxController {
  DateTime selectedDate = DateTime.now();

  setSelectedDate(input) {
    selectedDate = input.value;
    print(input);
    update();
  }
}
