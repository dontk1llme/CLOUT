import 'dart:convert';
import 'dart:io';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['CLOUT_APP_BASE_URL']!;

class AuthorizedApi {
  final userController = Get.find<UserController>();

  getRequest(apiUrl, parameter) async {
    var url = Uri.parse('$baseUrl$apiUrl$parameter');
    print(url);
    print(json.encode(parameter));
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': userController.accessToken
      },
    );
    print('get 통신 실행 완료');
    var statusCode = response.statusCode;
    var body = utf8.decode(response.bodyBytes);
    var returnVal = {
      'statusCode': statusCode,
      'body': body,
    };

    print('상태코드');
    print(statusCode);

    if (statusCode == 401) {
      print('만료된 토큰');
    } else {
      return returnVal;
    }
  }

  postRequest(apiUrl, parameter) async {
    var url = Uri.parse('$baseUrl$apiUrl');
    print(url);
    print(json.encode(parameter));
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': userController.accessToken
      },
      body: json.encode(parameter),
    );

    print('post 통신 실행 완료');

    var statusCode = response.statusCode;
    var body = utf8.decode(response.bodyBytes);
    var returnVal = {
      'statusCode': statusCode,
      'body': body,
    };

    print('상태코드');
    print(statusCode);

    if (statusCode == 401) {
      print('만료된 토큰');
    } else {
      return returnVal;
    }
  }

  reissueToken() async {
    var url = Uri.parse('$baseUrl/member-service/v1/members/reissue');
    print(userController.refreshToken);
    http.Response response = await http.post(
      url,
      headers: {
        // "Content-Type": "application/json",
        // HttpHeaders.authorizationHeader : userController.refreshToken,
        'REFRESH_TOKEN': userController.refreshToken,
        // 'Authorization': userController.accessToken,
      },
    );
    print('토큰 리이슈 Response');
    print(response.statusCode);
    print(response.headers);
    print(utf8.decode(response.bodyBytes));

    // userController.setAccessToken(resonse)
  }

  deleteRequest(apiUrl, parameter) async {
    var url = Uri.parse('$baseUrl$apiUrl');
    print(url);
    print(json.encode(parameter));
    http.Response response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': userController.accessToken
      },
      body: json.encode(parameter),
    );

    print('delete 통신 실행 완료');

    var statusCode = response.statusCode;
    var body = utf8.decode(response.bodyBytes);
    var returnVal = {
      'statusCode': statusCode,
      'body': body,
    };

    print('상태코드');
    print(statusCode);

    if (statusCode == 401) {
      print('만료된 토큰');
    } else {
      return returnVal;
    }
  }
}
