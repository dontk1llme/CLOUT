import 'package:clout/screens/mypage/widgets/gray_title.dart';
import 'package:clout/screens/point/withdraw/widgets/bold_text.dart';
import 'package:clout/screens/point/withdraw/widgets/medium_text.dart';
import 'package:clout/widgets/buttons/big_button.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;

// widgets
import 'package:clout/widgets/buttons/small_button.dart';
import 'package:clout/screens/campaign_register/widgets/data_title.dart';

class SelectItemBox extends StatefulWidget {
  const SelectItemBox({super.key});

  @override
  State<SelectItemBox> createState() => _SelectItemBoxState();
}

class _SelectItemBoxState extends State<SelectItemBox> {
  void _selectClouter() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 410,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.close,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/clouterImage.jpg',
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('MochaMilk',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: style.colors['main1'])),
                      MediumText(text: ' 님을'),
                    ],
                  ),
                  MediumText(text: '클라우터로'),
                  MediumText(text: '채택할까요?'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: BigButton(
                        title: '아니요',
                        textColor: Colors.black,
                        buttonColor: style.colors['lightgray'],
                        function: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      flex: 1,
                      child: BigButton(
                        title: '채택하기',
                      )),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _showContent() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.close,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/clouterImage.jpg',
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('MochaMilk',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: style.colors['main1'])),
                              MediumText(text: ' 님의'),
                            ],
                          ),
                          MediumText(text: '한마디')
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: style.colors['lightgray']!,
                      ),
                    ),
                    height: 200,
                    child: SingleChildScrollView(
                      child: Text(
                        '저 정말 잘할 자신 있읍니다. 저 정말 잘할 자신 있읍니다. 저 정말 잘할 자신 있읍니다. 저 정말 잘할 자신 있읍니다. 저 정말 잘할 자신 있읍니다. 저 정말 잘할 자신 있읍니다. 저 정말 잘할 자신 있읍니다. 저 정말 잘할 자신 있읍니다. 저 정말 잘할 자신 있읍니다. 저 정말 잘할 자신 있읍니다.  저 정말 잘할 자신 있읍니다.  저 정말 잘할 자신 있읍니다.',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.monetization_on_outlined,
                          size: 20, color: style.colors['main1']),
                      Text(' 희망 광고비',
                          style: style.textTheme.headlineMedium?.copyWith(
                              color: style.colors['darkgray'],
                              fontWeight: FontWeight.w600)),
                      SizedBox(width: 20),
                      DataTitle(text: '1,000 포인트'),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: BigButton(
                        title: '아니요',
                        textColor: Colors.black,
                        buttonColor: style.colors['lightgray'],
                        function: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      flex: 1,
                      child: BigButton(
                          title: '채택하기',
                          function: () {
                            // Navigator.of(context).pop();
                            _selectClouter();
                          })),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: style.colors['white'],
          borderRadius: BorderRadius.circular(10), // 2.5% of screen width
          boxShadow: style.shadows['shadow'],
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Image.asset(
                'assets/images/clouterImage.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DataTitle(text: 'MochaMilk '),
                      Text('희망 광고비'),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Text('165만 ', style: TextStyle(fontSize: 15)),
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Text('20.5'),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('3,000',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: style.colors['main1'],
                                  fontWeight: FontWeight.bold)),
                          Text(' points')
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SmallButton(
                          title: '한마디 보기',
                          function: _showContent,
                        ),
                      ),
                      SizedBox(width: 3),
                      Flexible(
                        flex: 1,
                        child: SmallButton(
                          title: '채택하기',
                          function: _selectClouter,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
