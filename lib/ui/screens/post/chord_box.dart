import 'package:flutter/material.dart';

class ChordBox extends StatefulWidget {
  const ChordBox({this.chordName, this.onDragCallback});

  final Function onDragCallback;
  final String chordName;

  @override
  _ChordBoxState createState() => _ChordBoxState();
}

class _ChordBoxState extends State<ChordBox> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Draggable(
         onDragStarted: () => widget.onDragCallback(),
          data: widget.chordName,
          child: Container(
            width: 40,
            height: 40,
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
                color: theme.accentColor.withOpacity(0.5),
                fontSize: 40),
          )),
    );
  }
}
