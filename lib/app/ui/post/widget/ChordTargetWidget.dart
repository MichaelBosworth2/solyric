import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:vibrate/vibrate.dart';

class ChordTargetWidget extends StatefulWidget {
  ChordTargetWidget({this.chord});

  final String chord;

  @override
  _ChordTargetWidgetState createState() => _ChordTargetWidgetState();
}

class _ChordTargetWidgetState extends State<ChordTargetWidget> {
  String _caughtChord;
  bool fromUser = false;

  @override
  void initState() {
    if (widget.chord != null && widget.chord.isNotEmpty) {
      _caughtChord = widget.chord;
      fromUser = true;
    }
    super.initState();
  }

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
                      child: Text(Resources.DELETE,
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
                Container(
                  height: 25,
                  width: 20,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(_caughtChord == null ? "  " : _caughtChord,
                        style: TextStyle(
                            fontSize: 16,
                            color: theme.accentColor,
                            fontWeight: FontWeight.bold)),
                  ),
                )));
  }

  _vibrate() async {
    var canVibrate = await Vibrate.canVibrate;
    if (canVibrate) Vibrate.feedback(FeedbackType.light);
  }
}
