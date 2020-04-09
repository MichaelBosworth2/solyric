import 'package:flutter/cupertino.dart';
import 'package:solyric_app/ui/viewmodel/base_viewmodel.dart';
import 'package:solyric_app/ui/widget/post/lyric/chord_line.dart';

class LyricViewModel extends BaseViewModel {
  LyricViewModel({this.onRefreshState});

  final _lyricLines = List<ChordLine>();
  final Function onRefreshState;

  List<ChordLine> chordLines() => _lyricLines;

  initialize(BuildContext context) =>
      _lyricLines.add(_chordLineBuilder(context));

  _chordLineBuilder(BuildContext context) {
    return ChordLine(
      onDelete: (position) {
        _lyricLines.removeAt(position);
        FocusScope.of(context).previousFocus();
        onRefreshState();
      },
      onNextLine: () {
        _lyricLines.add(_chordLineBuilder(context));
        onRefreshState();
      },
      position: _lyricLines.length,
    );
  }
}
