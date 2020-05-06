import 'package:flutter/material.dart';
import 'package:solyric_app/domain/model/ChordBox.dart';

class ChordBoxWidget extends StatefulWidget {
  ChordBoxWidget({this.chordName, this.subChords, this.longClick});

  final Function(List<String>) longClick;
  final List<String> subChords;
  final String chordName;

  @override
  _ChordBoxWidgetState createState() => _ChordBoxWidgetState();
}

class _ChordBoxWidgetState extends State<ChordBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onLongPress: () => widget.longClick(widget.subChords),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Draggable(
          feedbackOffset: Offset(0.0, -75.0),
          dragAnchor: DragAnchor.child,
          data: widget.chordName,
          child: Container(
            height: 35,
            child: Center(
              child: Text(
                widget.chordName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.accentColor,
                    fontSize: 20),
              ),
            ),
          ),
          feedback: Text(
            widget.chordName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.accentColor,
                fontSize: 35),
          ),
        ),
      ),
    );
  }
}
