import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/GetChordHistoryUseCase.dart';
import 'package:solyric_app/domain/interaction/GetChordsUseCase.dart';
import 'package:solyric_app/domain/model/ChordBox.dart';

class ChordListViewModel extends BaseViewModel {
  ChordListViewModel(
      {@required GetChordsUseCase chordUseCase,
      @required GetChordHistoryUseCase historyUseCase})
      : _lyricChordsUseCase = chordUseCase,
        _historyUseCase = historyUseCase;

  final GetChordHistoryUseCase _historyUseCase;
  final GetChordsUseCase _lyricChordsUseCase;
  final chords = List<ChordBox>();
  var historical = false;

  void getLyricChords(int lyricId) async {
    setLoading(true);
    chords.clear();
    chords.addAll(await _lyricChordsUseCase.getChords(lyricId));
    setLoading(false);
  }

  void getChordHistory(int lyricId) async {
    setLoading(true);
    chords.clear();
    chords.addAll(historical
        ? await _lyricChordsUseCase.getChords(lyricId)
        : await _historyUseCase.getChordHistory());
    historical = !historical;
    setLoading(false);
  }
}
