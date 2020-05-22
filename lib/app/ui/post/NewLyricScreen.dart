import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/post/EditLyricScreen.dart';
import 'package:solyric_app/app/ui/post/viewmodel/NewLyricViewModel.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';
import 'package:solyric_app/domain/model/Chord.dart';

class NewLyricScreen extends StatefulWidget {
  NewLyricScreen({@required bool editMode}) : editMode = editMode;
  final bool editMode;

  @override
  _NewLyricScreenState createState() => _NewLyricScreenState();
}

class _NewLyricScreenState extends State<NewLyricScreen> {
  Lyric _lyric;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NewLyricViewModel>(
      onModelReady: (controller, model) async {
        _lyric = await model.getLyric(3, widget.editMode);
      },
      builder: (context, model, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                centerTitle: true,
                title: UIHelper.actionBarLogo(Resources.IC_LOGO),
                actions: UIHelper.actionBarActions(context),
                bottom: TabBar(indicatorColor: Colors.white, tabs: [
                  Tab(text: Resources.GUITAR_TITLE),
                  Tab(text: Resources.PIANO_TITLE)
                ])),
            body: model.isLoading
                ? Center(child: CircularProgressIndicator())
                : TabBarView(children: [
                    EditLyricScreen(lyric: _lyric),
                    EditLyricScreen(lyric: _lyric)
                  ])),
      ),
    );
  }
}
