import 'package:clout/providers/image_picker_provider.dart';
import 'package:clout/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';
import 'package:clout/screens/join/widgets/small_button.dart';
import 'package:clout/screens/join/numberVerify.dart';
import 'package:clout/widgets/input/input.dart';

class ClouterJoin2 extends ConsumerStatefulWidget {
  ClouterJoin2({super.key});

  @override
  _ClouterJoin2State createState() => _ClouterJoin2State();
}

class _ClouterJoin2State extends ConsumerState<ClouterJoin2> {
  var id;
  var password;
  var checkPassword;
  var nickName;
  var images;

  var obscured = true;
  Icon suffixIcon = Icon(Icons.visibility);
  var doubleId = 1;

  setDoubleId() {
    setState(() {
      //없을 때 0
      //중복이면 1
      //가능하면 2
      //지금은 편의상 중복 아니라고 함
      doubleId = 2;
      print(doubleId);
    });
  }

  setId(input) {
    setState(() {
      id = input;
    });
  }

  setPassword(input) {
    setState(() {
      password = input;
    });
  }

  setCheckPassword(input) {
    setState(() {
      checkPassword = input;
    });
  }

  setNickName(input) {
    setState(() {
      nickName = input;
    });
  }

  setImages(input) {
    setState(() {
      images = input;
    });
    print(images);
  }

  Future runImageProvider() async {
    final newImages = ref.watch(imagePickerProvider);
    setImages(newImages);
  }

  setObscured() {
    setState(() {
      obscured = !obscured;
      print(obscured);
      if (obscured) {
        suffixIcon = Icon(Icons.visibility_outlined);
      } else {
        suffixIcon = Icon(Icons.visibility_off_outlined);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '2. 계정 설정',
            style: style.textTheme.titleSmall,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Input(
            placeholder: '닉네임 입력',
            setText: setNickName,
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Input(
                placeholder: '아이디 입력',
                setText: setId,
              ),
              Positioned(
                right: 10,
                top: 10,
                child: SmallButton(
                  title: '중복\n확인',
                  function: setDoubleId,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.only(left: 180),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerRight,
              ),
              onPressed: () {},
              child: doubleId == 1
                  ? Text(
                      '아이디 중복 확인이 필요해요',
                      style: style.textTheme.bodyMedium?.copyWith(
                        color: style.colors['gray'],
                        height: 2,
                      ),
                    )
                  : doubleId == 2
                      ? Text(
                          '사용 가능한 아이디입니다',
                          style: style.textTheme.bodyMedium?.copyWith(
                            color: style.colors['main1'],
                            height: 2,
                          ),
                        )
                      : Text(
                          '이미 사용 중인 아이디입니다',
                          style: style.textTheme.bodyMedium?.copyWith(
                            color: style.colors['Darkgray'],
                            height: 2,
                          ),
                        ),
            ),
          ),
          SizedBox(height: 5),
          Input(
            placeholder: '패스워드 입력',
            setText: setPassword,
            obscure: obscured,
            suffixIcon: suffixIcon,
            setObscured: setObscured,
          ),
          SizedBox(height: 10),
          Input(
            placeholder: '패스워드 확인',
            setText: setCheckPassword,
            obscure: obscured,
            suffixIcon: suffixIcon,
          ),
          SizedBox(height: 10),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  '활동 대표 사진',
                  style: style.textTheme.headlineMedium,
                ),
                SizedBox(height: 10),
                ImageWidget(parentImages: images),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
