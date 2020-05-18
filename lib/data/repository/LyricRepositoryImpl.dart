import 'package:solyric_app/data/dummy/LyricDummyDataSource.dart';
import 'package:solyric_app/data/networking/SolyricApi.dart';
import 'package:solyric_app/domain/model/Chord.dart';
import 'package:solyric_app/domain/model/ChordBox.dart';
import 'package:solyric_app/domain/repository/LyricsRepository.dart';

class LyricRepositoryImpl implements LyricRepository {
  LyricRepositoryImpl({SolyricApi api}) : _api = api;
  // TODO delete lyric dummy data source
  final dummyDataSource = LyricDummyDataSource();
  final SolyricApi _api;

  @override
  Future<List<ChordBox>> getChordBoxes(int lyricId) async {
    return dummyDataSource.chordBoxes;
  }

  @override
  Future<Lyric> getChordItem(int lyricId) async {
    return dummyDataSource.chordItem;
  }

  @override
  Future<Lyric> createNewLyric() async {
    return dummyDataSource.emptyChord;
  }

  @override
  Future<List<ChordBox>> getChordHistory() async {
    return dummyDataSource.history;
  }
}
