import 'package:finances_easy_app/src/models/user.dart';
import 'package:finances_easy_app/src/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {

  UserService _authService = UserService();

  User _loggedUser;

  User get loggedUser => _loggedUser;

  bool get isAuthenticate => _loggedUser?.token != null;

  Future<void> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      _loggedUser = await _authService.login(
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
    _loggedUser = await _authService.getCurrentUser();
    notifyListeners();
    return true;
  }

  Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await _authService.logout();
    if(success) {
      prefs.clear();
      _loggedUser = null;
    }
    return success;
  }

}