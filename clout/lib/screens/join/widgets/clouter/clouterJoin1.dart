import 'package:clout/providers/clouter_register_controller.dart';
import 'package:clout/screens/join/widgets/big_button.dart';
import 'package:clout/screens/join/widgets/clouter/widgets/join_input.dart';
import 'package:clout/widgets/input/input_elements/widgets/date_input.dart';
import 'package:clout/widgets/address/library_daum_postcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:clout/screens/join/widgets/small_button.dart';
import 'package:clout/screens/join/numberVerify.dart';
import 'package:clout/widgets/input/input.dart';
import 'package:flutter/services.dart';
import 'package:daum_postcode_search/daum_postcode_search.dart';
import 'package:clout/widgets/address/library_daum_post_webview.dart';

class ClouterJoin1 extends StatefulWidget {
  ClouterJoin1({Key? key}) : super(key: key);

  @override
  ClouterJoin1State createState() => ClouterJoin1State();
}

class ClouterJoin1State extends State<ClouterJoin1> {
  DataModel? _dataModel;
  var daumAddress = '주소 검색';
  var detailAddress;
  String finalAddress = '';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClouterRegisterController>(
      builder: (controller) => FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '1. 기본 정보',
              style: style.textTheme.titleSmall,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            JoinInput(
              keyboardType: TextInputType.text,
              maxLength: 20,
              title: '이름 입력',
              label: '이름',
              setState: controller.setName,
            ),
            SizedBox(height: 10),
            DateInput(setState: controller.setBirthday),
            SizedBox(height: 10),
            Stack(
              children: [
                JoinInput(
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  title: '휴대전화 번호 입력',
                  label: '휴대전화 번호',
                  setState: controller.setPhoneNumber,
                ),
                Positioned(
                  right: 10,
                  top: 2,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => NumberVerify()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: style.colors['main1'],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('인증'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              '주소 정보 입력',
              style: style.textTheme.bodyMedium,
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: GestureDetector(
                onTap: () async {
                  HapticFeedback.mediumImpact();
                  final value = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LibraryDaumPostcodeScreen(),
                    ),
                  );
                  if (value != null) {
                    print(value); // 테스트용 로그
                    final DataModel dataModel = value;
                    setState(() {
                      _dataModel = dataModel;
                      daumAddress = dataModel.address ?? '';
                      controller.setAddress(daumAddress);
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1, // 보더의 두께 설정
                      color: Colors.grey, // 보더의 색상 설정
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '   ' + daumAddress,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            JoinInput(
              keyboardType: TextInputType.text,
              maxLength: 30,
              title: '상세 주소 입력',
              label: '상세 주소',
              // setState: controller.setAddress,
              setState: (input) {
                detailAddress = input;
                if (daumAddress != null) {
                  final newAddress = daumAddress + ' ' + detailAddress;
                  if (controller.address != newAddress) {
                    controller.setAddress(newAddress);
                    // controller.update();
                    print(controller.address);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
