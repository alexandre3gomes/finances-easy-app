import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  
  static Future<Map<String, dynamic>> getLabels() async {
    final response = await http.get('https://finances-easy-web.herokuapp.com/assets/i18n/en.json');
    return jsonDecode(response.body);
  }
}