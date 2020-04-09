import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:solyric_app/ui/screens/post/chord_target.dart';

class ChordText extends SpecialText {
  static const String flag = " ";

  ChordText(TextStyle textStyle, SpecialTextGestureTapCallback onTap,
      {this.start, this.width})
      : super(flag, " ", textStyle, onTap: onTap);

  final double width;
  final int start;

  @override
  InlineSpan finishText() {
    var text = toString();
    text = start == 0 ? text.substring(1, text.length) : text;
    print(text);
    return ExtendedWidgetSpan(
      actualText: text,
      start: start,
      child: Wrap(
        verticalDirection: VerticalDirection.down,
          spacing: 0.0,
          runSpacing: 0.0,
          children: <Widget>[
          ...text.split("").map((char) {
        if (char == "\n") {
          return SizedBox(width: width);
        } else {
          return ChordTarget();
        }
      }).toList()
      ],
    ));
  }
}
