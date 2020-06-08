import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solyric_app/app/ui/post/controller/ChordTargetController.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:vibrate/vibrate.dart';

class ChordTargetWidget extends StatefulWidget {
  ChordTargetWidget({@required this.chord, @required this.controller});

  final ChordTargetController controller;
  final String chord;

  @override
  _ChordTargetWidgetState createState() => _ChordTargetWidgetState();
}

class _ChordTargetWidgetState extends State<ChordTargetWidget> {
  ChordTargetController _controller;
  String _caughtChord;
  bool fromUser = false;

  @override
  void initState() {
    initialization();
    super.initState();
  }

  void _requestChord() => widget.controller.chordName = _caughtChord;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DragTarget(
      onAccept: (String chord) => _acceptBehavior(chord),
      onWillAccept: (chord) => _willAcceptBehavior(chord),
      onLeave: (chord) => _onLeave(chord),
      builder: (BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,) =>
          PopupMenuButton(
              itemBuilder: (BuildContext context) =>
              [PopupMenuItem(child: _deletePopUpButton(theme))],
              child: Container(
                height: 15,
                width: 20,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(_caughtChord == null ? "  " : _caughtChord,
                      style: _dropDownStyle(theme)),
                ),
              )),
    );
  }

  /// Builds delete pop up button
  _deletePopUpButton(ThemeData theme) =>
      FlatButton(
        onPressed: () =>
            setState(() {
              this._caughtChord = null;
              Navigator.pop(context);
              fromUser = false;
            }),
        textColor: theme.accentColor,
        child: Text(Resources.DELETE,
            style: TextStyle(
                fontSize: 16,
                color: theme.primaryColor,
                fontWeight: FontWeight.bold)),
      );

  /// Make device vibrate
  void _vibrate() async {
    var canVibrate = await Vibrate.canVibrate;
    if (canVibrate) Vibrate.feedback(FeedbackType.light);
  }

  /// Draggable item accept behavior
  void _acceptBehavior(String chord) {
    fromUser = true;
    _caughtChord = chord;
  }

  /// Draggable item acceptance criteria
  bool _willAcceptBehavior(String chord) {
    if (_caughtChord == null) {
      _caughtChord = chord;
    }
    _vibrate();
    return true;
  }

  TextStyle _dropDownStyle(ThemeData theme) =>
      TextStyle(
          fontSize: 16, color: theme.accentColor, fontWeight: FontWeight.bold);

  /// Draggable item leave behavior
  void _onLeave(String chord) {
    if (!fromUser) {
      _caughtChord = null;
    }
  }

  /// Required chord target set up
  void initialization() {
    _controller = widget.controller;
    _controller.addListener(() => _requestChord());
    if (widget.chord != null && widget.chord.isNotEmpty) {
      _caughtChord = widget.chord;
      fromUser = true;
    }
  }
}
