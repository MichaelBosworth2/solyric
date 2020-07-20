import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/ChordInfo/GuitarChordInformation.dart';
import 'package:solyric_app/app/ui/ChordInfo/PianoChordInformation.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class ChordInformationScreen extends StatefulWidget {
  static const int _tabBarLength = 2;

  @override
  _ChordInformationScreenState createState() => _ChordInformationScreenState();
}

class _ChordInformationScreenState extends State<ChordInformationScreen> {
  @override
  Widget build(BuildContext context) => BaseWidget<ChordTabsViewModel>(
      child: _appBarBuilder(),
      onModelReady: (controller, model) => model.buildLocalChords(),
      builder: (context, model, child) => DefaultTabController(
            length: ChordInformationScreen._tabBarLength,
            child: Scaffold(
                appBar: child,
                body: model.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                            GuitarChordInformation(),
                            PianoChordInformation()
                          ])),
          ));

  Widget _appBarBuilder() => AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: UIHelper.actionBarLogo(Resources.IC_LOGO),
      actions: UIHelper.actionBarActions(context),
      bottom: TabBar(isScrollable: false, indicatorColor: Colors.white, tabs: [
        Tab(text: Resources.GUITAR_TITLE),
        Tab(text: Resources.PIANO_TITLE)
      ]));
}
