import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/domain/model/ChordBox.dart';

import 'ChordBoxWidget.dart';

class ChordList extends StatefulWidget {
  const ChordList({this.onDragCallback, @required this.lyricChords});

  final List<ChordBox> lyricChords;
  final Function onDragCallback;

  @override
  _ChordListState createState() => _ChordListState();
}

class _ChordListState extends State<ChordList> {
  final subChords = List<String>();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
            color: Colors.black12,
            child: Row(
              children: <Widget>[
                if (subChords.isNotEmpty)
                  Column(
                    children: <Widget>[
                      ...subChords
                          .map((chord) => ChordBoxWidget(chordName: chord))
                    ],
                  ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
                      child: SvgPicture.asset(
                        Resources.IC_TIME,
                        height: 35,
                        width: 35,
                      ),
                    ),
                    ...widget.lyricChords.map((model) {
                      return ChordBoxWidget(
                        chordName: model.chordName,
                        subChords: model.subChords,
                        longClick: _onChordBoxLongClick,
                      );
                    })
                  ],
                )
              ],
            )),
      );

  void _onChordBoxLongClick(subChords) => setState(() {
        this.subChords.addAll(subChords);
      });
}
