import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['CLOUT_APP_BASE_URL']!;

class LoginApi {
  postRequest(apiUrl, parameter) async {
    var url = Uri.parse('${baseUrl}${apiUrl}');
    print(url);
    print(json.encode(parameter));
    //////////////////////////////////////////
    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(parameter),
    ); 

    var statusCode = response.statusCode;
    var headers = response.headers;
    var body = utf8.decode(response.bodyBytes);

    print('상태코드');
    print(statusCode);
    print('response 헤더');
    print(headers);
    print('response 바디');
    print(body); 

    if (statusCode == 201) {
      return response.body; //{'clouterId'/'advertiserId' : integer}
    } else {
      print('흐앵');
      return false;
    }
  }

}
