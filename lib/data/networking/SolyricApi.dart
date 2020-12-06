import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:solyric_app/domain/model/User.dart' as userModel;
import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SolyricApi {
  static const _apiKey = "?key=AIzaSyArNCJvvTGzAW09A4fdh-Snk3WJmeG9JDY";
  static const _authBase =
      "https://www.googleapis.com/identitytoolkit/v3/relyingparty/";
  static const _baseUrl = "https://solyric-96ad6.firebaseio.com/";
  static const _reset =
      "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode";

  /*
   * New instance to database with Firebase
   */
  final databaseReference = FirebaseFirestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<http.Response> resetPassword(String email) =>
      http.post("$_reset$_apiKey",
          body: json.encode(
            {
              "requestType": "PASSWORD_RESET",
              "email": email,
            },
          ));

  Future<http.Response> signUp(userModel.User user) =>
      http.post("${_authBase}signupNewUser$_apiKey",
          body: json.encode(
            {
              "email": user.email,
              "password": user.password,
              "returnSecureToken": true,
            },
          ));

  Future<UserCredential> login(userModel.User user) => auth
      .signInWithEmailAndPassword(email: user.email, password: user.password);

  Future<DocumentReference> createUsername(String username, String uid) =>
      databaseReference
          .collection("users")
          .add({'uid': uid, 'username': username});

  Future<bool> isExistUsername(String username) async {
    bool isExist = false;

    var querySnapshot = await databaseReference
        .collection("users")
        .where("username", isEqualTo: username)
        .get();

    querySnapshot.docs.forEach((result) {
      if (result['username'] == username) {
        isExist = true;
      }
    });

    return isExist;
  }
}
