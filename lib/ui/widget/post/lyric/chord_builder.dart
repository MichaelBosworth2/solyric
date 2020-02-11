import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/material.dart';
import 'package:solyric_app/ui/widget/post/lyric/chord_text.dart';

class ChordBuilder extends SpecialTextSpanBuilder {

  ChordBuilder(this.width);
  final width;

  @override
  TextSpan build(String data, {TextStyle textStyle, onTap}) {
    TextSpan result = super.build(data, textStyle: textStyle, onTap: onTap);
    return result;
  }

  @override
  SpecialText createSpecialText(String flag,
      {TextStyle textStyle, onTap, int index}) {
    if (flag == null) return null;

    if (isStart(flag, ChordText.flag)) {
      return ChordText(textStyle, onTap, start: index, width: width);
    }
    return null;
  }
}
