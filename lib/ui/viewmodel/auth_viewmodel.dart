import 'package:flutter/material.dart';
import 'package:solyric_app/core/model/User.dart';
import 'package:solyric_app/core/services/AuthService.dart';
import 'package:solyric_app/ui/viewmodel/base_viewmodel.dart';

class AuthenticationViewModel extends BaseViewModel {
  final AuthenticationService _authService;
  String error = "No Error";

  AuthenticationViewModel({@required AuthenticationService authService})
      : _authService = authService;

  Future<bool> login(User user) async {
    setLoading(true);
    final success = await _authService.login(user);
    error = _authService.error;
    setLoading(false);
    return success;
  }

  Future<bool> signUp(User user) async {
    setLoading(true);
    final success = await _authService.signUp(user);
    error = _authService.error;
    setLoading(false);
    return success;
  }

  Future<bool> resetPassword(String email) async {
    setLoading(true);
    final success = await _authService.resetPassword(email);
    error = _authService.error;
    setLoading(false);
    return success;
  }

}
