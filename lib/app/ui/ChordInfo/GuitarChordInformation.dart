import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/ChordInfo/widget/ChordListWidget.dart';
import 'package:solyric_app/app/ui/ChordInfo/widget/ChordPagerWidget.dart';
import 'package:solyric_app/app/ui/ChordInfo/widget/HorizontalScrollerWidget.dart';
import 'package:solyric_app/app/utils/Resources.dart';

class GuitarChordInformation extends StatelessWidget {
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
            child: Row(
              children: [
                Expanded(flex: 8, child: ChordPagerWidget(key: UniqueKey())),
                Expanded(flex: 2, child: ChordListWidget())
              ],
            ),
          ),
          Expanded(flex: 3, child: HorizontalScrollerWidget())
        ],
      ),
    );
  }
}
