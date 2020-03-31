import 'package:finances_easy_app/src/models/user.dart';
import 'package:finances_easy_app/src/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {

  UserService _userService = UserService();

  User _loggedUser;

  User get loggedUser => _loggedUser;

  bool get isAuthenticate => _loggedUser?.token != null;

  Future<void> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      _loggedUser = await _userService.login(
          User(username: username, password: password, name: '', token: ''));
      prefs.setString('token', loggedUser.token);
    } catch (exception) {
      throw exception;
    }
  }

  Future<bool> tryAutoLogon() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('token')) {
      return false;
    }
    _loggedUser = await _userService.getCurrentUser();
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    _loggedUser = null;
    prefs.clear();
  }

}