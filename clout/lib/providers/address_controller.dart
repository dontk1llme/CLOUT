import 'package:daum_postcode_search/data_model.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  DataModel? dataModel;
  var daumAddress = '주소 검색';
  var detailAddress;
  var finalAddress = '';

  setDataModel(input) {
    dataModel = input;
    update();
  }

  setDaumAddress(input) {
    daumAddress = input;
    update();
  }

  setDetailAddress(input) {
    detailAddress = input;
    setFinalAddress();
    update();
  }

  setFinalAddress() {
    finalAddress = '${daumAddress} ${detailAddress}';
    update();
  }
}
