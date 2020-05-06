import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/app/ui/post/widget/ChordLineController.dart';
import 'package:solyric_app/app/ui/post/widget/ChordLineWidget.dart';
import 'package:solyric_app/domain/interaction/GetChordBoxesUseCase.dart';
import 'package:solyric_app/domain/interaction/GetChordItemUseCase.dart';
import 'package:solyric_app/domain/model/ChordBox.dart';
import 'package:solyric_app/domain/model/ChordLine.dart';

class NewLyricViewModel extends BaseViewModel {
  NewLyricViewModel(
      {@required GetLyricChordBoxesUseCase chordUseCase,
      @required GetChordItemUseCase lineUseCase}) {
    _lyricChordLineUseCase = lineUseCase;
    _lyricChordsUseCase = chordUseCase;
    lyricLines = List<ChordLineWidget>();
    loadLyricData(3400);
  }

  GetChordItemUseCase _lyricChordLineUseCase;
  GetLyricChordBoxesUseCase _lyricChordsUseCase;

  List<ChordBox> lyricChords;
  List<ChordLineWidget> lyricLines;
  String title;

  Function redraw;

  void loadLyricData(int lyricId) async {
    setLoading(true);
    lyricChords = await _lyricChordsUseCase.getChords(lyricId);
    var chord = await _lyricChordLineUseCase.getChordItem(lyricId);
    for (var i = 0; i < chord.lines.length; i++) {
      _chordLineWidgetBuilder(i, chord.lines[i]);
    }
    title = chord.title;
    setLoading(false);
  }

  _chordLineWidgetBuilder(int position, ChordLine line) {
    var controller = ChordLineController();
    lyricLines.add(ChordLineWidget(
      chordLine: line,
      controller: controller,
      onDelete: (currentPosition) {
        if (lyricLines.length > 1) {
          lyricLines.removeLast();
          lyricLines.last.controller.requestFocus();
          if (redraw != null) redraw();
        }
      },
      onNextLine: (currentPosition) {
        if (currentPosition == lyricLines.length - 1) {
          _chordLineWidgetBuilder(currentPosition, ChordLine.emptyLine());
        }
      },
      position: lyricLines.length,
    ));
    return controller;
  }
}
