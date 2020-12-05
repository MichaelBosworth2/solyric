import 'dart:convert';
import 'package:solyric_app/app/utils/ParseJwt.dart';

import 'package:solyric_app/data/networking/SolyricApi.dart';
import 'package:solyric_app/domain/model/User.dart';
import 'package:solyric_app/domain/repository/AuthRepository.dart';
import 'package:solyric_app/app/utils/AuthStatus.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({SolyricApi api}) : _api = api;
  final SolyricApi _api;

  @override
  Future<bool> login(User user) async {
    try {
      final response = await _api.login(user);
      print('response');
      print(response.user.uid);
      // final responseData = json.decode(response.body);
      // if (responseData['error'] != null)
      //   throw Exception(responseData['error']['message']);
      // // TODO do something with auth user
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> resetPassword(String email) async {
    try {
      final response = await _api.resetPassword(email);
      final responseData = json.decode(response.body);
      if (responseData['error'] != null)
        throw Exception(responseData['error']['message']);
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  @override
  Future<AuthStatus> signUp(User user) async {
    try {
      final response = await _api.signUp(user);
      final responseData = json.decode(response.body);
      AuthStatus _authStatus = AuthStatus.NOT_SIGNUP;
      if (responseData['error'] != null) {
        if (responseData['error']['message'] == 'EMAIL_EXISTS') {
          _authStatus = AuthStatus.EMAIL_EXIST;
        }
      } else {
        // Save Username
        var claims = parseJwt(responseData['idToken']);
        createUsername(user.username, claims['user_id']);
        _authStatus = AuthStatus.SIGNUP_SUCCESSFULLY;
      }

      return _authStatus;
    } on Exception catch (exception) {
      return AuthStatus.UNDEFINED_ERROR;
    }
  }

  @override
  Future<AuthStatus> createUsername(String username, String uid) async {
    try {
      await _api.createUsername(username, uid);
      return AuthStatus.USERNAME_SAVED;
    } on Exception catch (exception) {
      return AuthStatus.UNDEFINED_ERROR;
    }
  }

  @override
  Future<AuthStatus> isExistUsername(String username) async {
    try {
      bool isExist = await _api.isExistUsername(username);
      if (isExist) {
        return AuthStatus.USERNAME_NO_AVAILABLE;
      } else {
        return AuthStatus.USERNAME_AVAILABLE;
      }
    } on Exception catch (exception) {
      return AuthStatus.UNDEFINED_ERROR;
    }
  }
}
