import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/post/util/ConfirmationAction.dart';
import 'package:solyric_app/app/ui/post/viewmodel/EditLyricViewModel.dart';
import 'package:solyric_app/app/ui/post/widget/ChordListWidget.dart';
import 'package:solyric_app/app/ui/post/widget/ChordTitleWidget.dart';
import 'package:solyric_app/app/utils/DialogHelper.dart';
import 'package:solyric_app/domain/model/Chord.dart';

import 'controller/ChordTitleController.dart';

class EditLyricScreen extends StatefulWidget {
  EditLyricScreen({@required Lyric lyric}) : lyric = lyric;
  final Lyric lyric;

  @override
  _EditLyricScreenState createState() => _EditLyricScreenState();
}

class _EditLyricScreenState extends State<EditLyricScreen> {
  final titleController = ChordTitleController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BaseWidget<EditLyricViewModel>(
        onBackPressed: () => _onBackPressed(context),
        onModelReady: (controller, model) => _onModelReady(controller, model),
        builder: (context, model, child) => Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Row(
                children: <Widget>[
                  Expanded(child: _buildLyricContent(deviceSize, model)),
                  ChordListWidget()
                ],
              ),
            ));
  }

  /// Builds editable lyric content based on ViewModel's lyric lines
  /// @see also
  /// [ChordTitleWidget] chord's content title
  /// [ChordLineWidget] widget representation of a single chord line
  Widget _buildLyricContent(Size deviceSize, EditLyricViewModel model) =>
      SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: deviceSize.height),
              child: Container(
                color: Colors.grey.shade200,
                child: Card(
                  margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        ChordTitleWidget(
                          title: model.title,
                          controller: titleController,
                        ),
                        ...model.lyricLines,
                      ],
                    ),
                  ),
                ),
              )));

  /// On model ready lyrics screen behavior
  _onModelReady(BaseWidgetController controller, EditLyricViewModel model) {
    model.redraw = () => controller.refreshState();
    if (model.lyricLines.isEmpty) model.editorInitialization(widget.lyric);
  }

  /// Executed before exiting this screen
  Future<bool> _onBackPressed(BuildContext context) async {
    titleController.requestTitle();
    switch (await DialogHelper.wantToSaveYourLyric(
        context, titleController.title)) {
      case ConfirmationAction.Discard:
        return true;
      case ConfirmationAction.Yes:
        return await _saveLyricBehavior(context);
      default:
        return false;
    }
  }

  /// Save this into a [Lyric] model representation
  Future<bool> _saveLyricBehavior(BuildContext context) async {
    var model = Provider.of<EditLyricViewModel>(context);
    titleController.requestTitle();
    final chord = Lyric(
        userId: 1,
        title: titleController.title,
        lines: model.lyricLines.map((chordLineWidget) {
          chordLineWidget.controller.requestLine();
          final line = chordLineWidget.controller.chordLine;
          return line;
        }).toList());
    model.clear();
    // TODO complete Lyric model
    // TODO save this chord locally on db
    return true;
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }
}
