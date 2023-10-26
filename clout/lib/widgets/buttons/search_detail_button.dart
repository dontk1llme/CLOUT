import 'package:clout/screens/campaign_register/widgets/age_slider.dart';
import 'package:clout/widgets/input/input.dart';
import 'package:clout/widgets/input/input_elements/widgets/dropdown_input.dart';
import 'package:clout/widgets/sns/sns3.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../style.dart' as style;

class SearchDetailButton extends StatelessWidget {
  SearchDetailButton({super.key, this.setAge, this.ageRanges});

  var setAge;
  var ageRanges;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // 가장 오른쪽으로 정렬
      children: <Widget>[
        InkWell(
          child: Row(children: [
            Text(
              '검색 조건 설정',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Icon(Icons.chevron_right, size: 20)
          ]),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  // color: Colors.black,
                  height: 600,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text('Close BottomSheet'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('상세 조건 설정'),
                              Icon(Icons.close),
                            ]),
                        Text('광고 희망 플랫폼'),
                        Sns3(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('다중 선택 가능'),
                        ),
                        Text('희망 클라우터 나이'),
                        // slider 추가
                        AgeSlider(setAge: setAge, ageRanges: ageRanges),
                        // dropdown 추가
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
