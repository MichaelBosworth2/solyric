import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/ui/screens/post/chord_box.dart';
import 'package:solyric_app/ui/shared/Resources.dart';

class ChordList extends StatelessWidget {
  const ChordList({this.onDragCallback});

  final Function onDragCallback;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  Resources.icTime,
                  height: 40,
                  width: 40,
                ),
              ),
              ChordBox("C#"),
              ChordBox("D#"),
              ChordBox("F#"),
              ChordBox("G#"),
              ChordBox("H#"),
              ChordBox("I#"),
              ChordBox("C#"),
              ChordBox("D#"),
              ChordBox("F#"),
              ChordBox("G#"),
              ChordBox("H#"),
              ChordBox("I#"),
              ChordBox("C#"),
              ChordBox("D#"),
              ChordBox("F#"),
              ChordBox("G#"),
              ChordBox("H#"),
              ChordBox("I#"),
              ChordBox("C#"),
              ChordBox("D#"),
              ChordBox("F#"),
              ChordBox("G#"),
              ChordBox("H#"),
              ChordBox("I#")
            ],
          ),
        ),
      );
}
