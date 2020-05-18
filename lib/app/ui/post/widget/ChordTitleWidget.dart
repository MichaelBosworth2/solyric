import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/ui/post/controller/ChordTitleController.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class ChordTitleWidget extends StatefulWidget {
  ChordTitleWidget({@required this.title, @required this.controller});

  final ChordTitleController controller;
  final String title;

  @override
  _ChordTitleWidgetState createState() => _ChordTitleWidgetState();
}

class _ChordTitleWidgetState extends State<ChordTitleWidget> {
  TextEditingController _titleController = TextEditingController();
  ChordTitleController _widgetController;

  @override
  void initState() {
    _widgetController = widget.controller;
    _titleController.text = widget.title;
    _widgetController.addListener(() => requestTitle());
    super.initState();
  }

  void requestTitle() => widget.controller.title = _titleController.text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UIHelper.verticalSpaceSmall,
        Row(
          children: [_buildTitleTextArea(), _buildTitleAudioResource()],
        ),
        Divider(
          color: Colors.grey,
          height: 3,
        ),
        UIHelper.verticalSpaceSmall
      ],
    );
  }

  /// Builds title text area using [_titleController]
  Widget _buildTitleTextArea() => Expanded(
        child: TextField(
          style: TextStyle(fontSize: 18),
          maxLength: 30,
          controller: _titleController,
          decoration: InputDecoration(
              counterStyle: TextStyle(fontSize: 0),
              border: InputBorder.none,
              labelText: Resources.LYRIC_TITLE,
              labelStyle: TextStyle(color: Colors.grey)),
        ),
      );

  /// Builds title icon resource
  /// @see [SvgPicture]
  Widget _buildTitleAudioResource() => SvgPicture.asset(
        Resources.IC_AUDIO,
        height: 40,
        width: 40,
      );

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}
