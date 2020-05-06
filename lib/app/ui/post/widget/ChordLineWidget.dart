import 'package:flutter/material.dart';
import 'package:solyric_app/domain/model/ChordLine.dart';

import 'ChordLineController.dart';
import 'ChordTargetWidget.dart';

class ChordLineWidget extends StatefulWidget {
  ChordLineWidget(
      {this.onDelete,
      this.onNextLine,
      this.position,
      this.controller,
      this.chordLine});

  final ChordLine chordLine;
  final ChordLineController controller;
  final Function(int) onDelete;
  final Function(int) onNextLine;
  final int position;

  @override
  ChordLineWidgetState createState() => ChordLineWidgetState();
}

class ChordLineWidgetState extends State<ChordLineWidget> {
  final _lineController = TextEditingController();
  FocusNode _lineFocusNode = FocusNode();
  final _targets = List<ChordTargetWidget>();
  ChordLineController _controller;

  void requestFocus() => _lineFocusNode.requestFocus();

  @override
  void initState() {
    _lineController.text = widget.chordLine.text;
    widget.chordLine.chords
        .forEach((chord) => _targets.add(ChordTargetWidget(chord: chord)));
    _controller = widget.controller;
    _controller.addListener(() => _lineFocusNode.requestFocus());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    executeAfterBuild();
    return Column(
      children: <Widget>[
        Row(children: [..._targets]),
        TextField(
          maxLength: 35,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
              counterStyle: TextStyle(fontSize: 0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.2),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.2),
              )),
          autofocus: true,
          focusNode: _lineFocusNode,
          controller: _lineController,
          onSubmitted: (data) => widget.onNextLine(widget.position),
          onChanged: (data) {
            if (_lineController.text.isEmpty) {
              widget.onDelete(widget.position);
            }
          },
          keyboardType: TextInputType.text,
          maxLines: 1,
        )
      ],
    );
  }

  Future<void> executeAfterBuild() async {
    _lineFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _lineFocusNode.dispose();
    _lineController.dispose();
    super.dispose();
  }
}
