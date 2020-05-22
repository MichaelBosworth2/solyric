import 'package:solyric_app/domain/model/Chord.dart';
import 'package:solyric_app/domain/repository/LyricsRepository.dart';

class NewLyricUseCase {
  NewLyricUseCase({LyricRepository repo}) : _repo = repo;
  final LyricRepository _repo;

  Future<Lyric> createNewLyric() async => _repo.createNewLyric();
}