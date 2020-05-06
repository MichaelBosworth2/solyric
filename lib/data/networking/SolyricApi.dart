import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:solyric_app/domain/model/User.dart';

class SolyricApi {

  static const _apiKey = "?key=AIzaSyDSZGMRqEqvOaidVa5IOmIFVqTww8slQWA";
  static const _authBase = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/";
  static const _baseUrl = "https://sorliric-alpha.firebaseio.com/";
  static const _reset = "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode";

  Future<http.Response> resetPassword(String email) =>
      http.post("$_reset$_apiKey",
          body: json.encode(
            {
              "requestType": "PASSWORD_RESET",
              "email": email,
            },
          ));

  Future<http.Response> signUp(User user) =>
      http.post("${_authBase}signupNewUser$_apiKey",
          body: json.encode(
            {
              "email": user.email,
              "password": user.password,
              "returnSecureToken": true,
            },
          ));

  Future<http.Response> login(User user) =>
      http.post("${_authBase}verifyPassword$_apiKey",
          body: json.encode(
            {
              "email": user.email,
              "password": user.password,
              "returnSecureToken": true,
            },
          ));
}
