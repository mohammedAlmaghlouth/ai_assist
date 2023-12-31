import 'dart:convert';
import 'package:ai_assist/shared/openai_api.dart';
import 'package:http/http.dart' as http;

class Api {
  static final url = Uri.parse("https://api.openai.com/v1/images/generations");

  static final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $OPENAI_API_KEY"
  };

  static generateImage(String text, String size) async {
    var res = await http.post(
      url,
      headers: headers,
      body: jsonEncode({"prompt": text, "n": 1, "size": size}),
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());

      return data['data'][0]['url'].toString();
    } else {
      print("Failed to fetch image");
    }
  }
}
