import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChordTarget extends StatefulWidget {
  ChordTarget(this.chordText);

  final String chordText;

  @override
  _ChordTargetState createState() => _ChordTargetState();
}

class _ChordTargetState extends State<ChordTarget> {
  String _caughtChord;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DragTarget(
      onAccept: (String chord) {
        _caughtChord = chord;
      },
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) =>
          _caughtChord == null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("",
                        style: TextStyle(
                            fontSize: 10,
                            color: theme.accentColor,
                            fontWeight: FontWeight.bold)),
                    Text(widget.chordText, style: TextStyle(fontSize: 16))
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(_caughtChord,
                        style: TextStyle(
                            fontSize: 10,
                            color: theme.accentColor,
                            fontWeight: FontWeight.bold)),
                    Text(widget.chordText, style: TextStyle(fontSize: 16))
                  ],
                ),
    );
  }
}
