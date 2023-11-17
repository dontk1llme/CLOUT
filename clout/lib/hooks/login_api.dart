import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['CLOUT_APP_BASE_URL']!;

class LoginApi {
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

    var body = utf8.decode(response.bodyBytes); //여기로 클라우터인지 광고주인지 넘어와야됨. 승구형해줘
    print('로그인 response 바디');
    print(body); 

    
    var loginSuccess = false;
    var authorization = headers['authorization'];
    var refresh_token =  headers['refresh_token'];
    var clout_or_adv = 1; //바디에서 받아서 설정해야 함
    

    if (statusCode == 200) {
      loginSuccess = true;
      print('로그인 성공');
       var responseData = {
        'login_success': loginSuccess,
        'authorization': authorization,
        'refresh_token': refresh_token,
        'clout_or_adv': clout_or_adv,
      };
      print(responseData);
      return responseData; //{'clouterId'/'advertiserId' : integer}
    }
    else if(statusCode==202){
      //비번 틀렷거나 뭐 그런... 백에서 넘겨주는 에러코드
    } 
    else {
      print('로그인 흐앵');
      print(statusCode);
      return false;
    }
  }

}
