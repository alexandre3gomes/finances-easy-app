import 'dart:convert';

import 'package:finances_easy_app/src/models/user.dart';
import 'package:finances_easy_app/src/services/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService with BaseService {

  static final String _url = 'user/';

  Future<User> login(User user) async {
    const url = 'public/logon/login';
    final body = jsonEncode(user.toJson());
    Map<String, dynamic> userJson = await post(url, body);
    return User.fromJson(userJson);
  }

  Future<User> getCurrentUser() async {
    Map<String, dynamic> userJson = await get(_url + 'current');
    return User.fromJson(userJson);
  }

  Future<bool> logout() async {
    return await get(_url + 'logout');
  }

}