import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/app/ui/post/controller/ChordLineController.dart';
import 'package:solyric_app/app/ui/post/widget/ChordLineWidget.dart';
import 'package:solyric_app/domain/model/Chord.dart';
import 'package:solyric_app/domain/model/ChordLine.dart';

class EditLyricViewModel extends BaseViewModel {
  final lyricLines = List<ChordLineWidget>();

  /// Redraw custom callback
  /// Invoke's setState() host's callback
  Function redraw;
  String title;

  /// Editor set up method
  /// Builds a chord line for each [ChordLine] in response
  editorInitialization(Lyric chord) {
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
      if (redraw != null) redraw();
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
