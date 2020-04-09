import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:vibrate/vibrate.dart';

class ChordTarget extends StatefulWidget {
  @override
  _ChordTargetState createState() => _ChordTargetState();
}

class _ChordTargetState extends State<ChordTarget> {
  String _caughtChord;
  bool fromUser = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
        onLongPress: () => showModalBottomSheet(
            context: context,
            builder: (BuildContext ctx) => Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => setState(() {
                        _caughtChord = null;
                        Navigator.pop(context);
                      }),
                      textColor: theme.accentColor,
                      child: Text(Resources.delete,
                          style: TextStyle(
                              fontSize: 16,
                              color: theme.primaryColor,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                )),
        child: DragTarget(
            onAccept: (String chord) {
              fromUser = true;
              _caughtChord = chord;
            },
            onWillAccept: (chord) {
              if (_caughtChord == null) {
                _caughtChord = chord;
              }
              _vibrate();
              return true;
            },
            onLeave: (chord) {
              if (!fromUser) {
                _caughtChord = null;
              }
            },
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) =>
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(_caughtChord == null ? "  " : _caughtChord,
                      style: TextStyle(
                          fontSize: 16,
                          color: theme.accentColor,
                          fontWeight: FontWeight.bold)),
                )));
  }

  _vibrate() async {
    var canVibrate = await Vibrate.canVibrate;
    if (canVibrate) Vibrate.feedback(FeedbackType.light);
  }
}
