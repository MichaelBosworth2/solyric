import 'package:flutter/material.dart';

class User {
  const User(
      {this.uid,
      @required this.email,
      @required this.password,
      @required this.username});

  final String uid;
  final String email;
  final String password;
  final String username;
}
