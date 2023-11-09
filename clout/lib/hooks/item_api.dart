import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['CLOUT_APP_BASE_URL']!;

class ItemApi {
  getRequest(endPoint, parameter) async {
    var url = Uri.parse('${baseUrl}${endPoint}${parameter}');
    print('3️⃣');
    print(url);
    print(json.encode(parameter));
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

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
