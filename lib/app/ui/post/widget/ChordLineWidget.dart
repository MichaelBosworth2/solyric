import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/post/controller/ChordTargetController.dart';
import 'package:solyric_app/domain/model/ChordLine.dart';

import '../controller/ChordLineController.dart';
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
  final FocusNode _lineFocusNode = FocusNode();
  final _targets = List<ChordTargetWidget>();
  ChordLineController _widgetController;

  void _requestLine() => widget.controller.chordLine = ChordLine(
      text: _lineController.text,
      chords: _targets.map((chord) {
        chord.controller.requestChord();
        return chord.controller.chordName;
      }).toList());

  @override
  void initState() {
    _chordLineInitialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Container(child: Row(children: [..._targets]), height: 15),
          TextField(
              autofocus: false,
              maxLength: 35,
              style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
              decoration: _buildLineDecoration(),
              focusNode: _lineFocusNode,
              controller: _lineController,
              onSubmitted: (data) => widget.onNextLine(widget.position),
              onChanged: (data) {
                if (_lineController.text.isEmpty) {
                  widget.onDelete(widget.position);
                }
              },
              keyboardType: TextInputType.text,
              maxLines: 1)
        ],
      );

  @override
  void dispose() {
    _lineFocusNode.dispose();
    _lineController.dispose();
    super.dispose();
  }

  /// Build Chord Line decoration
  InputDecoration _buildLineDecoration() => InputDecoration(
      contentPadding: EdgeInsets.all(0.0),
      isDense: true,
      border: InputBorder.none,
      counterStyle: const TextStyle(fontSize: 0));

  /// Necessary chord line widget set up
  _chordLineInitialization() {
    _lineController.text = widget.chordLine.text;
    if (_targets.isEmpty)
      widget.chordLine.chords.forEach((chord) => _targets.add(ChordTargetWidget(
          chord: chord, controller: ChordTargetController())));
    _widgetController = widget.controller;
    _widgetController.addListener(() => _lineFocusNode.requestFocus());
    _widgetController.addListener(() => _requestLine());
  }
}
