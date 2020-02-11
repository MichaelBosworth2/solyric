import 'dart:async';
import 'dart:convert';

import 'package:solyric_app/core/model/User.dart';

import 'Api.dart';

class AuthenticationService {
  AuthenticationService({Api api}) : _api = api;
  final Api _api;

  StreamController<User> _userController = StreamController<User>();
  String _customError = "No Error";

  get error => _customError;

  Stream<User> get user => _userController.stream;

  Future<bool> resetPassword(String email) async {
    try {
      final response = await _api.resetPassword(email);
      final responseData = json.decode(response.body);
      if (responseData['error'] != null)
        throw Exception(responseData['error']['message']);
      return true;
    } catch (error) {
      _customError = error;
      print(error);
      return false;
    }
  }

  Future<bool> login(User user) async {
    try {
      final response = await _api.login(user);
      final responseData = json.decode(response.body);
      if (responseData['error'] != null)
        throw Exception(responseData['error']['message']);
      _userController.add(user);
      return true;
    } catch (error) {
      _customError = error;
      print(error);
      return false;
    }
  }

  Future<bool> signUp(User user) async {
    try {
      final response = await _api.signUp(user);
      final responseData = json.decode(response.body);
      if (responseData['error'] != null)
        throw Exception(responseData['error']['message']);
      _userController.add(user);
      return true;
    } catch (error) {
      _customError = error;
      print(error);
      return false;
    }
  }
}
