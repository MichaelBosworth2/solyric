import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/post/widget/ChordTitleWidget.dart';

class ChordTitleController extends ChangeNotifier {
  /// [ChordTitleWidget] title
  /// [requestLine] must be called before for this to be available
  String title;

  /// Requests [ChordTitleWidget] title
  requestTitle() => notifyListeners();
}