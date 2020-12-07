import 'dart:convert';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:solyric_app/domain/model/ProfileUserInfo.dart';
import 'package:solyric_app/domain/model/User.dart' as userModel;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solyric_app/domain/model/UserPosts.dart';

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

  // USER PROFILE
  Future<ProfileUserInfo> getProfile() async {
    final userId = auth.currentUser.uid;
    var profileInfo = new ProfileUserInfo();
    var query = await databaseReference
        .collection("users")
        .where("uid", isEqualTo: userId)
        .get();

    query.docs.forEach((element) {
      profileInfo.name = element['name'];
      profileInfo.lastname = element['lastname'];
      profileInfo.about = element['about'];
      profileInfo.photo = element['photo'];
    });

    return profileInfo;
  }

  // USER FEED
  Future<List<UserPosts>> getUserPosts() async {
    final userId = auth.currentUser.uid;
    List<UserPosts> allUserPosts = new List();
    UserPosts userPosts =
        new UserPosts(title: null, attachment: null, description: null);

    final query = await databaseReference
        .collection("posts")
        .where("user_uid", isEqualTo: userId)
        .get();

    query.docs.forEach((element) {
      userPosts.title = element['title'];
      userPosts.attachment = element['attachment'];
      userPosts.description = element['description'];
      // userPosts.timepost = element['timepost'];

      allUserPosts.add(userPosts);
    });

    return allUserPosts;
  }
}
