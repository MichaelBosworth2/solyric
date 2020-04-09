import 'package:flutter/material.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/viewmodel/lyric_viewmodel.dart';
import 'package:solyric_app/ui/widget/base_widget.dart';
import 'package:solyric_app/ui/widget/post/lyric/chord_list.dart';
import 'package:solyric_app/ui/widget/post/lyric/chord_title.dart';

class NewLyric extends StatefulWidget {
  @override
  _NewLyricState createState() => _NewLyricState();
}

class _NewLyricState extends State<NewLyric> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BaseWidget<LyricViewModel>(
      model:
          LyricViewModel(onRefreshState: (focusNode) => setState(() => null)),
      onModelReady: (model) => model.initialize(context),
      child: ChordTitle(),
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
                                    child,
                                    ...model.chordLines(),
                                  ],
                                ),
                              ),
                            ),
                          )))),
              ChordList()
            ],
          ),
        ),
      ),
    );
  }
}
