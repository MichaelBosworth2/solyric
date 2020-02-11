import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/viewmodel/lyric_viewmodel.dart';
import 'package:solyric_app/ui/widget/base_widget.dart';
import 'package:solyric_app/ui/widget/post/lyric/chord_builder.dart';
import 'package:solyric_app/ui/widget/post/lyric/chord_list.dart';

class NewLyric extends StatefulWidget {
  @override
  _NewLyricState createState() => _NewLyricState();
}

class _NewLyricState extends State<NewLyric> {
  TextEditingController _lyricController = TextEditingController();
  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BaseWidget<LyricViewModel>(
      model: LyricViewModel(),
      child: _formChild(),
      builder: (context, model, child) => Scaffold(
        appBar: UIHelper.solyricAppBar(context),
        body: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minHeight: deviceSize.height - 80),
                          child: Container(
                            color: Colors.black12,
                            child: Card(
                              margin: EdgeInsets.all(8.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    _formChild(),
                                    ExtendedTextField(
                                      style: TextStyle(fontSize: 16),
                                      controller: _lyricController,
                                      specialTextSpanBuilder: ChordBuilder(
                                          MediaQuery.of(context).size.width),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )))),
              ChordList(
                  onDragCallback: () =>
                      model.handleSpecialDrag(_lyricController))
            ],
          ),
        ),
      ),
    );
  }

  _formChild() => Column(
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

  @override
  void dispose() {
    _titleController.dispose();
    _lyricController.dispose();
    super.dispose();
  }
}
