import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['CLOUT_APP_BASE_URL']!;

class PointsApi {
  static getRequest(apiUrl, memberId, authorization) async {
    var url = Uri.parse('${baseUrl}${apiUrl}?memberId=${memberId}');
    print(url);
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json",
      "Authorization": authorization  // 헤더에 parameter 넣어줘야함
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // print('포인트');
      // print(utf8.decode(response.bodyBytes));
      return utf8.decode(response.bodyBytes);
    } else {
      print('포인트 들어왔는데 에러');
      return null;
    }
  }
}
