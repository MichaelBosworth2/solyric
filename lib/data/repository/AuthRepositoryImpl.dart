import 'dart:convert';

import 'package:solyric_app/data/networking/SolyricApi.dart';
import 'package:solyric_app/domain/model/User.dart';
import 'package:solyric_app/domain/repository/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({SolyricApi api}) : _api = api;
  final SolyricApi _api;

  @override
  Future<bool> login(User user) async {
    try {
      final response = await _api.login(user);
      final responseData = json.decode(response.body);
      if (responseData['error'] != null)
        throw Exception(responseData['error']['message']);
      // TODO do something with auth user
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
  Future<bool> signUp(User user) async {
    try {
      final response = await _api.signUp(user);
      final responseData = json.decode(response.body);
      print('responseData');
      print(responseData);
      if (responseData['error'] != null)
        throw Exception(responseData['error']['message']);
      // TODO do something with auth user
      return true;
    } catch (error) {
      print('ERROR signUp');
      print(error);
      return false;
    }
  }

}
