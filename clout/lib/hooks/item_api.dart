import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['CLOUT_APP_BASE_URL']!;

class ItemApi {
  Future<String?> getRequest(String endPoint, String parameter,
      {String? accessToken}) async {
    var url = Uri.parse('$baseUrl$endPoint$parameter');
    var headers = {
      "Content-Type": "application/json",
      if (accessToken != null) "Authorization": "Bearer $accessToken",
    };

    var response = await http.get(url, headers: headers);

    print('4️⃣');
    print('응답코드 입니다. ${response.statusCode}');
    print('응답메시지: ${utf8.decode(response.bodyBytes)}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('👻✨ response body: ${response.body} // 👉 item_api.dart');
      return utf8.decode(response.bodyBytes);
    } else {
      return null;
    }
  }
}
