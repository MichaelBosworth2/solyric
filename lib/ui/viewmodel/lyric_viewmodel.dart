import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:solyric_app/ui/viewmodel/base_viewmodel.dart';
import 'package:solyric_app/ui/widget/post/lyric/chord_builder.dart';
import 'package:solyric_app/ui/widget/post/lyric/chord_text.dart';

class LyricViewModel extends BaseViewModel {

  void handleSpecialDrag(TextEditingController controller) =>
      _buildChordSpecialText(controller);

  /// handles [ChordText] special key text triggering logic , See [ChordBuilder]
  /// And [ChordText.flag] For more information about special text triggering logic
  void _buildChordSpecialText(TextEditingController controller) {
    var input = controller.text;
    var concat = "";

    var words = input.split(" ");
    words.removeWhere((words) => words.isEmpty);
    for (int i = 0; i < words.length; i++) {
      concat += " ${words[i]} ";
    }

    controller.text = concat;
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
  }
}
