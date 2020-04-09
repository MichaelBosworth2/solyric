import 'package:flutter/material.dart';
import 'package:solyric_app/ui/screens/post/chord_target.dart';

class ChordLine extends StatefulWidget {
  ChordLine({this.onDelete, this.onNextLine, this.position}): super(key: key);

  final Function(int) onDelete;
  final Function onNextLine;
  final int position;

  @override
  ChordLineState createState() => ChordLineState();
}

class ChordLineState extends State<ChordLine> {

  TextEditingController _lineController = TextEditingController();
  FocusNode _lineFocusNode = FocusNode();

  void requestFocus() => _lineFocusNode.requestFocus();

  @override
  void initState() {
    _lineFocusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            ...List.generate(15, (index) => Expanded(child: ChordTarget()))
          ],
        ),
        TextField(
          style: TextStyle(fontSize: 18),
          decoration: new InputDecoration(
              border: InputBorder.none
          ),
          autofocus: true,
          focusNode: _lineFocusNode,
          controller: _lineController,
          onSubmitted: (data) => widget.onNextLine(),
          onChanged: (data) {
            if (_lineController.text.isEmpty) {
              widget.onDelete(widget.position);
            }
          },
          keyboardType: TextInputType.multiline,
          maxLines: 1,
        )
      ],
    );
  }

  @override
  void dispose() {
    _lineFocusNode.dispose();
    _lineController.dispose();
    super.dispose();
  }
}
