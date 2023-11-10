import 'dart:convert';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:clout/type.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['CLOUT_APP_BASE_URL']!;

class LoginApi {

  final userController = Get.find<UserController>();

  postRequest(apiUrl, parameter) async {
    var url = Uri.parse('${baseUrl}${apiUrl}');
    print(url);
    print(json.encode(parameter));
    /////////////////////////////////////////
    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(parameter),
    );

    var statusCode = response.statusCode;
    var headers = response.headers;
    print('로그인 response 헤더');
    print(headers);

    var body = utf8.decode(response.bodyBytes); 
    print('로그인 response 바디');
    print(jsonDecode(body));
    print(body);

    var loginSuccess = false;
    var authorization = headers['authorization'];
    var refreshToken = headers['refresh_token'];

    

    var memberRole =
        LoginResponse.fromJson(jsonDecode(body)).memberRole; //바디에서 받아서 설정해야 함
    var memberId =
        LoginResponse.fromJson(jsonDecode(body)).memberId; //바디에서 받아서 설정해야 함

    print('멤버타입: $memberRole');
    print('멤버아이디: $memberId');

    if (statusCode == 200) {
      loginSuccess = true;
      print('로그인 성공');
      var responseData = {
        'login_success': loginSuccess,
        'authorization': authorization,
        'refresh_token': refreshToken,
        'memberRole': memberRole,
        'memberId': memberId,
      };
      userController.setAccessToken(authorization);
      userController.setRefreshToken(refreshToken);
      print(responseData);
      return responseData; //{'clouterId'/'advertiserId' : integer}
    } else if (statusCode != 404 && statusCode != 401) {
      print('로그인 흐앵');
      Fluttertoast.showToast(msg: '아이디 혹은 비밀번호를 확인해주세요');
    }
  }
}
