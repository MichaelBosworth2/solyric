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
              ChordBox(
                chordName: "C#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "D#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "F#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "G#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "H#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "I#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "C#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "D#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "F#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "G#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "H#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "I#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "C#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "D#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "F#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "G#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "H#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "I#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "C#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "D#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "F#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "G#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "H#",
                onDragCallback: onDragCallback,
              ),
              ChordBox(
                chordName: "I#",
                onDragCallback: onDragCallback,
              )
            ],
          ),
        ),
      );
}
