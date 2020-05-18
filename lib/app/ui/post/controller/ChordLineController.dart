import 'package:flutter/foundation.dart';
import 'package:solyric_app/app/ui/post/widget/ChordLineWidget.dart';
import 'package:solyric_app/domain/model/ChordLine.dart';

class ChordLineController extends ChangeNotifier {
  /// [ChordLine] representing data on [ChordLineWidget]
  /// [requestLine] must be called before for this to be available
  ChordLine chordLine;

  /// Requests focus on [ChordLineWidget]
  requestFocus() => notifyListeners();

  /// Requests [ChordLine] data from [ChordLineWidget]
  requestLine() => notifyListeners();
}