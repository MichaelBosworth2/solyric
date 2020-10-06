import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/ChordInfo/piano/widget/PianoChordListWidget.dart';
import 'package:solyric_app/app/ui/ChordInfo/piano/widget/PianoChordPagerWidget.dart';
import 'package:solyric_app/app/ui/ChordInfo/piano/widget/PianoHorizontalScrollerWidget.dart';
import 'package:solyric_app/app/utils/Resources.dart';

class PianoChordInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Resources.BACKGROUND_GRADIENT),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Expanded(flex: 8, child: PianoChordPagerWidget(key: UniqueKey())),
                Expanded(flex: 2, child: PianoChordListWidget())
              ],
            ),
          ),
          Expanded(flex: 3, child: PianoHorizontalScrollerWidget())
        ],
      ),
    );
  }
}