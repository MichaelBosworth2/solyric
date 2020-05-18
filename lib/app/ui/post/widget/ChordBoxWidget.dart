import 'package:flutter/material.dart';

class ChordBoxWidget extends StatefulWidget {
  ChordBoxWidget({this.chordName, this.subChords});

  final List<String> subChords;
  final String chordName;

  @override
  _ChordBoxWidgetState createState() => _ChordBoxWidgetState();
}

class _ChordBoxWidgetState extends State<ChordBoxWidget> {
  final dropDownMenuItems = List<DropdownMenuItem>();
  String selectedValue;

  @override
  void initState() {
    /// initializes selected value
    /// insert chord name into sub chords first position
    if (selectedValue == null) {
      widget.subChords.insert(0, widget.chordName);
      selectedValue = widget.chordName;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _initializeDropDownMenu();
    return _buildDraggableWidget(theme);
  }

  /// Builds widget's draggable using App's Theme data
  /// @see [Draggable]
  Widget _buildDraggableWidget(ThemeData theme) => Draggable(
        feedbackOffset: Offset(0.0, -75.0),
        dragAnchor: DragAnchor.child,
        data: selectedValue,
        child: _buildDraggableChild(theme),
        feedback: _buildFeedBackDraggable(theme),
      );

  /// Builds widget's draggable feedback using App's Theme data
  /// @see [Draggable.feedback]
  _buildFeedBackDraggable(ThemeData theme) => Text(
        selectedValue,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.accentColor,
            fontSize: 35),
      );

  /// Builds widget's draggable child using App's Theme data
  /// @see [Draggable.child]
  _buildDraggableChild(ThemeData theme) => Container(
        alignment: AlignmentDirectional.center,
        width: double.infinity,
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.blue.shade800,
          ),
          child: DropdownButton(
            iconSize: 0,
            hint: _buildDraggableText(
                selectedValue, theme.accentColor, 20, FontWeight.bold),
            items: dropDownMenuItems,
            onChanged: (value) => setState(() => selectedValue = value),
          ),
        ),
      );

  /// Draggable text @param [text] to be displayed
  _buildDraggableText(
          String text, Color color, double fontSize, FontWeight font) =>
      Text(
        text,
        style: TextStyle(fontWeight: font, color: color, fontSize: fontSize),
      );

  /// Initialize dropdown menu
  _initializeDropDownMenu() {
    if (dropDownMenuItems.isEmpty) {
      dropDownMenuItems.addAll(widget.subChords.map((chord) => DropdownMenuItem(
            child:
                _buildDraggableText(chord, Colors.white, 16, FontWeight.normal),
            value: chord,
          )));
    }
  }
}
