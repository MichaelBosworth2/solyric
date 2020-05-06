import 'package:flutter/material.dart';
import 'package:solyric_app/domain/model/ChordLine.dart';

class Chord {
  Chord({@required this.title, @required this.lines});

  String title;
  List<ChordLine> lines;
}
