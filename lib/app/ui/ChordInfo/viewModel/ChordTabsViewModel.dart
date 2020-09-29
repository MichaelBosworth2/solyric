import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/domain/model/LocalChord.dart';
import 'package:solyric_app/domain/model/LocalChordVariation.dart';

class ChordTabsViewModel extends BaseViewModel {
  List<LocalChord> _localChords = List();
  LocalChordVariation _scrollerSelection;
  LocalChord _listSelection;

  LocalChordVariation get scrollerSelection => _scrollerSelection;
  LocalChord get listSelection => _listSelection;
  List<LocalChord> get localChords => _localChords;

  set scrollerSelection(LocalChordVariation value) {
    _scrollerSelection = value;
    notifyListeners();
  }

  set localChords(List<LocalChord> value) {
    _localChords = value;
    notifyListeners();
  }

  set listSelection(LocalChord value) {
    _listSelection = value;
    notifyListeners();
  }

  void buildLocalChords() async {
    setLoading(true);
    String jsonRawString = await rootBundle.loadString(Resources.GUITAR_CHORDS);
    final response = jsonDecode(jsonRawString);
    _localChords.clear();

    response['chords'].forEach((e) {
      _localChords.add(LocalChord.fromJson(e));
    });
    _scrollerSelection = _localChords.first.variations.first;
    _listSelection = _localChords.first;
    setLoading(false);
  }
}
