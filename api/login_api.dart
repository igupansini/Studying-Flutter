import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String email, String password) async {
    var url = 'http://example.com.br:4000/login';
    var header = {"Content-Type": "application/json"};
    Map params = {"email": email, "password": password};
    var _body = json.encode(params);

    var response = await http.post(url, headers: header, body: _body);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 201) {
      print('Response body: ${response.body}');
      return true;
    } else {
      return false;
    }
  }
}
