import 'package:flutter/material.dart';

class ChordLine {
  ChordLine({@required this.text, @required this.chords});

  List<String> chords;
  String text;

  static ChordLine emptyLine() =>
      ChordLine(text: "", chords: List.generate(15, (index) => null));
}
