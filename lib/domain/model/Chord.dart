import 'package:flutter/material.dart';
import 'package:solyric_app/domain/model/ChordLine.dart';

class Lyric {
  Lyric({@required this.userId, @required this.title, @required this.lines});

  int userId;
  String title;
  List<ChordLine> lines;
}
