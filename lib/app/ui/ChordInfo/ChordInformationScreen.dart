import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/ChordInfo/GuitarChordInformation.dart';
import 'package:solyric_app/app/ui/ChordInfo/PianoChordInformation.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/ui/ChordInfo/widget/ChordColoredTabBar.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/utils/Resources.dart';

class ChordInformationScreen extends StatefulWidget {
  static const int _tabBarLength = 2;

  @override
  _ChordInformationScreenState createState() => _ChordInformationScreenState();
}

class _ChordInformationScreenState extends State<ChordInformationScreen> {
  @override
  Widget build(BuildContext context) => BaseWidget<ChordTabsViewModel>(
      child: ChordColoredTabBar(
        Theme.of(context).primaryColor,
        TabBar(isScrollable: false, indicatorColor: Colors.white, tabs: [
          Tab(text: Resources.GUITAR_TITLE),
          Tab(text: Resources.PIANO_TITLE)
        ]),
      ),
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
}
