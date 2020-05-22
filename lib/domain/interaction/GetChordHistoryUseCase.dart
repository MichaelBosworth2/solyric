import 'package:solyric_app/domain/model/ChordBox.dart';
import 'package:solyric_app/domain/repository/LyricsRepository.dart';

class GetChordHistoryUseCase {
  GetChordHistoryUseCase({LyricRepository repo}) : _repo = repo;
  final LyricRepository _repo;

  Future<List<ChordBox>> getChordHistory() async => _repo.getChordHistory();
}
