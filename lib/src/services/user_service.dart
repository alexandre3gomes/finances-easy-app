import 'dart:convert';

import 'package:finances_easy_app/src/models/user.dart';
import 'package:finances_easy_app/src/services/base_service.dart';

class UserService with BaseService {

  Future<User> login(User user) async {
    const url = 'public/logon/login';
    final body = jsonEncode(user.toJson());
    Map<String, dynamic> userJson = await post(url, body);
    return User.fromJson(userJson);
  }

  Future<User> getCurrentUser() async {
    const url = 'user/current';
    Map<String, dynamic> userJson = await get(url);
    return User.fromJson(userJson);
  }

}