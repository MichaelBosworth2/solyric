import 'package:solyric_app/domain/model/Chord.dart';
import 'package:solyric_app/domain/model/ChordBox.dart';
import 'package:solyric_app/domain/model/ChordLine.dart';

class LyricDummyDataSource {
  var chordBoxes;
  var history;
  var chordItem;

  LyricDummyDataSource() {
    chordBoxes = [
      ChordBox(chordName: "A#", subChords: _genSubChordsFromText("A")),
      ChordBox(chordName: "B#", subChords: _genSubChordsFromText("B")),
      ChordBox(chordName: "C#", subChords: _genSubChordsFromText("C")),
      ChordBox(chordName: "D#", subChords: _genSubChordsFromText("D")),
      ChordBox(chordName: "E#", subChords: _genSubChordsFromText("E")),
      ChordBox(chordName: "F#", subChords: _genSubChordsFromText("F")),
      ChordBox(chordName: "G#", subChords: _genSubChordsFromText("G")),
      ChordBox(chordName: "H#", subChords: _genSubChordsFromText("H")),
      ChordBox(chordName: "I#", subChords: _genSubChordsFromText("I")),
      ChordBox(chordName: "J#", subChords: _genSubChordsFromText("J")),
      ChordBox(chordName: "A#", subChords: _genSubChordsFromText("A")),
      ChordBox(chordName: "B#", subChords: _genSubChordsFromText("B")),
      ChordBox(chordName: "C#", subChords: _genSubChordsFromText("C")),
      ChordBox(chordName: "D#", subChords: _genSubChordsFromText("D")),
      ChordBox(chordName: "E#", subChords: _genSubChordsFromText("E")),
      ChordBox(chordName: "F#", subChords: _genSubChordsFromText("F")),
      ChordBox(chordName: "G#", subChords: _genSubChordsFromText("G")),
      ChordBox(chordName: "H#", subChords: _genSubChordsFromText("H")),
      ChordBox(chordName: "I#", subChords: _genSubChordsFromText("I")),
      ChordBox(chordName: "J#", subChords: _genSubChordsFromText("J")),
    ];
    history = [
      ChordBox(chordName: "I#", subChords: _genSubChordsFromText("I")),
      ChordBox(chordName: "I#", subChords: _genSubChordsFromText("I")),
      ChordBox(chordName: "I#", subChords: _genSubChordsFromText("I")),
      ChordBox(chordName: "I#", subChords: _genSubChordsFromText("I")),
      ChordBox(chordName: "I#", subChords: _genSubChordsFromText("I")),
    ];
    chordItem = Lyric(title: "My Awesome Song", lines: [
      ChordLine(
          text: "Hello there, this is a sample text",
          chords: _getChordLinePresetChords()),
      ChordLine(
          text: "Hello there, this is a sample text",
          chords: _getChordLinePresetChords()),
      ChordLine(
          text: "Hello there, this is a sample text",
          chords: _getChordLinePresetChords()),
      ChordLine(
          text: "Hello there, this is a sample text",
          chords: _getChordLinePresetChords())
    ]);
  }

  List<String> _genSubChordsFromText(String chordName) =>
      List.generate(8, (index) => "${chordName}s${index + 1}");

  List<String> _getChordLinePresetChords() => [
    "B#",
    "",
    "",
    "C#",
    "E#",
    "",
    "E#",
    "",
    "",
    "H#",
    "E#",
    "",
    "",
    "E#",
    "",
  ];

  final emptyChord = Lyric(title: "Change Me", lines: [ChordLine.emptyLine()]);

}