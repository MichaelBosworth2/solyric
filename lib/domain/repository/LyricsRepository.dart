import 'package:solyric_app/domain/model/Chord.dart';
import 'package:solyric_app/domain/model/ChordBox.dart';

class LyricRepository {
  Future<List<ChordBox>> getChordBoxes(int lyricId) {
    throw Exception("Unimplemented exception");
  }

  Future<List<ChordBox>> getChordHistory() {
    throw Exception("Unimplemented exception");
  }

  Future<Lyric> getChordItem(int lyricId) {
    throw Exception("Unimplemented exception");
  }

  Future<Lyric> createNewLyric() {
    throw Exception("Unimplemented exception");
  }
}
