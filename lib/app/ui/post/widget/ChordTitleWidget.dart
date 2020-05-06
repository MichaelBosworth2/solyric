import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class ChordTitleWidget extends StatefulWidget {
  ChordTitleWidget(this.title);
  final String title;

  @override
  _ChordTitleWidgetState createState() => _ChordTitleWidgetState();
}

class _ChordTitleWidgetState extends State<ChordTitleWidget> {
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UIHelper.verticalSpaceSmall,
        Row(
          children: [
            Expanded(
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
            ),
            SvgPicture.asset(
              Resources.IC_AUDIO,
              height: 40,
              width: 40,
            )
          ],
        ),
        UIHelper.verticalSpaceSmall,
        Divider(
          color: Colors.grey,
          height: 3,
        ),
        UIHelper.verticalSpaceSmall
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}
