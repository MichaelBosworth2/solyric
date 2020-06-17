import 'package:solyric_app/domain/model/RecordAudio.dart';
import 'package:solyric_app/domain/repository/RecordAudioRepository.dart';

class RecordAudioUseCase {
  RecordAudioUseCase({RecordAudioRepository repo}) : _repo = repo;
  final RecordAudioRepository _repo;

  Future<bool> addAudio(RecordAudio audio) async => _repo.addAudio(audio);
}