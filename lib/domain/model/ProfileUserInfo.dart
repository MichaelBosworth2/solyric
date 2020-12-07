import 'package:flutter/material.dart';

class ProfileUserInfo {
  ProfileUserInfo(
      {this.name = "",
      this.lastname = "",
      this.about = "",
      this.photo = "",
      this.username = ""});

  String name;
  String lastname;
  String about;
  String photo;
  String username;
}
