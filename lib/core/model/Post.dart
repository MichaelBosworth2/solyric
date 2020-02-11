import 'package:flutter/material.dart';
import 'package:solyric_app/core/model/Comment.dart';

class Post {
  Post(
      {@required this.title,
      @required this.contentImage,
      @required this.likes,
      @required this.comments,
      @required this.audioLength});

  String title;
  int audioLength;
  String contentImage;
  int likes;
  List<Comment> comments;
}
