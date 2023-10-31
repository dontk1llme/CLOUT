import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:clout/style.dart' as style;
import 'package:clout/widgets/input/input.dart';
import 'package:clout/widgets/sns/sns3.dart';
import 'package:clout/screens/join/widgets/clouter/followersDropdown.dart';


class ClouterJoin2 extends StatefulWidget {
  ClouterJoin2({Key? key,}) : super(key: key);

  @override
  _ClouterJoin2State createState() => _ClouterJoin2State();
}

class _ClouterJoin2State extends State<ClouterJoin2> {
  double percent = 0.66; // 초기값 설정

  var nickName;
  var link;
  var channelName;
  var follower;
  var photos;

  setNickName(input) {
    setState(() {
      nickName = input;
    });
  }

  setLink(input) {
    setState(() {
      link = input;
    });
  }

  setChannelName(input) {
    setState(() {
      channelName = input;
    });
  }

  setFollower(input) {
    setState(() {
      nickName = input;
    });
  }

  setPhotos(input) {
    setState(() {
      photos = input;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            percent: percent,
            lineHeight: 10,
            backgroundColor: style.colors['category'],
            progressColor: style.colors['logo'],
            barRadius: Radius.circular(5),
          ),
          SizedBox(height: 20),  
          Text(
            '2. 클라우터 정보',
            style: style.textTheme.titleSmall, 
            textAlign: TextAlign.left, 
          ),
          SizedBox(height: 10),
          Input(
            placeholder: '닉네임 입력',
            setText: setNickName,
          ),
          SizedBox(height: 10),  
          Sns3(),
          SizedBox(height: 10),
          Input(
            placeholder: '채널 링크 입력',
            setText: setLink,
          ),
          SizedBox(height: 10),
          Input(
            placeholder: '계정명 또는 채널명',
            setText: setChannelName,
          ),
          SizedBox(height: 10), 
          FollowersDropdown(follower: follower, setFollower: setFollower),
          SizedBox(height: 10), 
          Text(
            '활동 대표 사진',
            style: style.textTheme.displayMedium,
            textAlign: TextAlign.left, 
          ),
          SizedBox(height: 10), 
          SizedBox(
                  height: 69,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerRight,
                    ),
                    onPressed: () {
                      // 나중에 이미지 업로드하는 함수 만들기. 아래 참고
                      // https://velog.io/@dosilv/Flutter-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%97%85%EB%A1%9C%EB%8D%94-%EB%A7%8C%EB%93%A4%EA%B8%B0
                    },
                    child: Image.asset('assets/images/addPhoto.png'),
                          ),),
        ],
      );
    }
  }
