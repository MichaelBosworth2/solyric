import 'package:solyric_app/domain/model/Chord.dart';
import 'package:solyric_app/domain/repository/LyricsRepository.dart';

class GetChordItemUseCase {
  GetChordItemUseCase({LyricRepository repo}) : _repo = repo;
  final LyricRepository _repo;

  Future<Chord> getChordItem(int id) async => _repo.getChordItem(id);
}
