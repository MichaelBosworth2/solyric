import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/domain/model/LocalChord.dart';
import 'package:solyric_app/domain/model/LocalChordVariation.dart';

class ChordTabsViewModel extends BaseViewModel {
  /// Piano stuff
  List<LocalChord> _localPianoChords = List();
  LocalChordVariation _pianoScrollerSelection;
  LocalChord _pianoListSelection;

  LocalChordVariation get pianoScrollerSelection => _pianoScrollerSelection;

  LocalChord get pianoListSelection => _pianoListSelection;

  List<LocalChord> get localPianoChords => _localPianoChords;

  set pianoScrollerSelection(LocalChordVariation value) {
    _pianoScrollerSelection = value;
    notifyListeners();
  }

  set localPianoChords(List<LocalChord> value) {
    _localPianoChords = value;
    notifyListeners();
  }

  set pianoListSelection(LocalChord value) {
    _pianoListSelection = value;
    notifyListeners();
  }

  /// Guitar stuff
  List<LocalChord> _localGuitarChords = List();
  LocalChordVariation _guitarScrollerSelection;
  LocalChord _guitarListSelection;

  LocalChordVariation get guitarScrollerSelection => _guitarScrollerSelection;

  LocalChord get guitarListSelection => _guitarListSelection;

  List<LocalChord> get localGuitarChords => _localGuitarChords;

  set guitarScrollerSelection(LocalChordVariation value) {
    _guitarScrollerSelection = value;
    notifyListeners();
  }

  set localGuitarChords(List<LocalChord> value) {
    _localGuitarChords = value;
    notifyListeners();
  }

  set guitarListSelection(LocalChord value) {
    _guitarListSelection = value;
    notifyListeners();
  }

  /// Chord builder methods

  void buildLocalChords() async {
    setLoading(true);
    _localGuitarChords.clear();
    await _loadGuitarChords();

    _localPianoChords.clear();
    await _loadPianoChords();
    setLoading(false);
  }

  Future<bool> _loadGuitarChords() async {
    final chords = await _loadChordsJsonFile(Resources.GUITAR_CHORDS);
    chords.forEach((e) => _localGuitarChords.add(LocalChord.fromJson(e)));
    _guitarScrollerSelection = _localGuitarChords.first.variations.first;
    _guitarListSelection = _localGuitarChords.first;
    return true;
  }

  Future<bool> _loadPianoChords() async {
    final chords = await _loadChordsJsonFile(Resources.PIANO_CHORDS);
    chords.forEach((e) => _localPianoChords.add(LocalChord.fromJson(e)));
    _pianoScrollerSelection = _localGuitarChords.first.variations.first;
    _pianoListSelection = _localGuitarChords.first;
    return true;
  }

  dynamic _loadChordsJsonFile(String path) async {
    String jsonRawString = await rootBundle.loadString(path);
    return jsonDecode(jsonRawString)['chords'];
  }
}
