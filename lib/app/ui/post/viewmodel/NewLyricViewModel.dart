import 'package:flutter/cupertino.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/GetChordItemUseCase.dart';
import 'package:solyric_app/domain/interaction/NewLyricUseCase.dart';
import 'package:solyric_app/domain/model/Chord.dart';

class NewLyricViewModel extends BaseViewModel {
  NewLyricViewModel(
      {@required GetChordItemUseCase lineUseCase,
      @required NewLyricUseCase createUseCase})
      : _lyricChordLineUseCase = lineUseCase,
        _createUseCase = createUseCase;

  final NewLyricUseCase _createUseCase;
  final GetChordItemUseCase _lyricChordLineUseCase;

  Future<Lyric> getLyric(int id, bool editMode) =>
      editMode == false ? _createNewLyric() : _getExistingLyricData(id);

  /// Get's lyric data based on lyricId
  Future<Lyric> _getExistingLyricData(int lyricId) async {
    setLoading(true);
    var lyric = await _lyricChordLineUseCase.getChordItem(lyricId);
    setLoading(false);
    return lyric;
  }

  /// Creates new lyric
  Future<Lyric> _createNewLyric() async {
    setLoading(true);
    var lyric = await _createUseCase.createNewLyric();
    setLoading(false);
    return lyric;
  }
}
