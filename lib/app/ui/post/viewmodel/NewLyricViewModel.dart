import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/app/ui/post/controller/ChordLineController.dart';
import 'package:solyric_app/app/ui/post/widget/ChordLineWidget.dart';
import 'package:solyric_app/domain/interaction/GetChordItemUseCase.dart';
import 'package:solyric_app/domain/interaction/NewLyricUseCase.dart';
import 'package:solyric_app/domain/model/Chord.dart';
import 'package:solyric_app/domain/model/ChordLine.dart';

class NewLyricViewModel extends BaseViewModel {
  NewLyricViewModel(
      {@required GetChordItemUseCase lineUseCase,
      @required NewLyricUseCase createUseCase})
      : _lyricChordLineUseCase = lineUseCase,
        _createUseCase = createUseCase;

  final NewLyricUseCase _createUseCase;
  final GetChordItemUseCase _lyricChordLineUseCase;
  final lyricLines = List<ChordLineWidget>();

  /// Redraw custom callback
  /// Invoke's setState() host's callback
  Function redraw;
  String title;

  /// Get's lyric data based on lyricId
  void getLyricData(int lyricId) async {
    setLoading(true);
    var chord = await _lyricChordLineUseCase.getChordItem(lyricId);
    _editorInitialization(chord);
    setLoading(false);
  }

  void createNewLyric() async {
    setLoading(true);
    var chord = await _createUseCase.createNewLyric();
    _editorInitialization(chord);
    setLoading(false);
  }

  _editorInitialization(Lyric chord) {
    for (var i = 0; i < chord.lines.length; i++) {
      _chordLineWidgetBuilder(i, chord.lines[i]);
    }
    title = chord.title;
  }

  /// Creates new chord line
  /// based on current position and chord line
  _chordLineWidgetBuilder(int position, ChordLine line) {
    var controller = ChordLineController();
    lyricLines.add(ChordLineWidget(
      chordLine: line,
      controller: controller,
      onDelete: (currentPosition) => _deleteBehavior(currentPosition),
      onNextLine: (currentPosition) => _nextLineBehavior(currentPosition),
      position: lyricLines.length,
    ));
    return controller;
  }

  /// Adds new chord line based on callback's position
  _nextLineBehavior(int currentPosition) {
    if (currentPosition == lyricLines.length - 1) {
      _chordLineWidgetBuilder(currentPosition, ChordLine.emptyLine());
    }
  }

  /// deletes last chord line in lyricsLine list
  /// Request previous line focus
  _deleteBehavior(int currentPosition) {
    print(currentPosition + 1);
    print(lyricLines.length);
    if (lyricLines.length > 1 && (currentPosition + 1) == lyricLines.length) {
      lyricLines.removeLast();
      lyricLines.last.controller.requestFocus();
      if (redraw != null) redraw();
    }
  }

  /// Clear all variables
  void clear() {
    this.lyricLines.clear();
    this.redraw = null;
    this.title = null;
  }
}
