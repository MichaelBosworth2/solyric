import 'package:flutter/material.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChordTitle extends StatefulWidget {
  @override
  _ChordTitleState createState() => _ChordTitleState();
}

class _ChordTitleState extends State<ChordTitle> {

  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UIHelper.verticalSpaceSmall,
        Row(
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLength: 30,
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: Resources.lyricTitle,
                    labelStyle: TextStyle(color: Colors.grey)),
              ),
            ),
            SvgPicture.asset(
              Resources.icAudio,
              height: 40,
              width: 40,
            )
          ],
        ),
        UIHelper.verticalSpaceSmall,
        Divider(
          color: Colors.grey,
          height: 2,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}