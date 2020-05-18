import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/post/viewmodel/ChordListViewModel.dart';
import 'package:solyric_app/app/ui/post/viewmodel/NewLyricViewModel.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/data/repository/LyricRepositoryImpl.dart';

import 'ChordBoxWidget.dart';

/// Builds a list of lyrics based on [NewLyricViewModel]'s lyric Chords
/// @see [LyricRepositoryImpl] for details on this widget source
class ChordListWidget extends StatefulWidget {
  @override
  _ChordListWidgetState createState() => _ChordListWidgetState();
}

class _ChordListWidgetState extends State<ChordListWidget> {
  @override
  Widget build(BuildContext context) =>
      BaseWidget<ChordListViewModel>(onModelReady: (controller, model) async {
        if (model.chords.isEmpty) {
          model.getLyricChords(3);
        }
      }, builder: (context, model, child) {
        return model.isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: double.infinity,
                color: Colors.black12,
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [_buildChordList(model)],
                  ),
                ),
              );
      });

  /// Builds Main Chord list based on widget's lyric chords
  /// Maps lyric chords into [ChordBoxWidget] for drag and drop functionality
  _buildChordList(ChordListViewModel model) => Container(
    width: 60,
    child: Column(
          children: <Widget>[
            _buildChordTimeAsset(model),
            ...model.chords.map((model) {
              return ChordBoxWidget(
                chordName: model.chordName,
                subChords: model.subChords,
              );
            })
          ],
        ),
  );

  /// Builds Main chord list time icon @see [SvgPicture]
  Widget _buildChordTimeAsset(ChordListViewModel model) => FlatButton(
      onPressed: () => model.getChordHistory(4),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
        child: SvgPicture.asset(
          Resources.IC_TIME,
          height: 35,
          width: 35,
        ),
      ));
}
