import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/post/widget/ChordTargetWidget.dart';

class ChordTargetController extends ChangeNotifier {
  /// [String] representing caught chord on [ChordTargetWidget]
  /// [requestChord] must be called before for this to be available
  String chordName;

  /// Requests [chordName] data from [ChordTargetWidget]
  requestChord() => notifyListeners();
}