import 'package:solyric_app/data/networking/SolyricDatabaseLocal.dart';
import 'package:solyric_app/domain/model/RecordAudio.dart';
import 'package:solyric_app/domain/repository/RecordAudioRepository.dart';


class RecordAudioRepositoryImpl implements RecordAudioRepository {
  RecordAudioRepositoryImpl({SolyricDatabaseLocal database}) : _database = database;
  final SolyricDatabaseLocal _database;

  @override
  Future<int> addAudio(RecordAudio audio) async {
    try {
      int idRecording = await _database.addAudio(audio);
      if(idRecording < 0){
        throw Exception('Not saved recording');
      }      
      return idRecording;
    } catch (error) {
       print('Error to call LOCALSTORAGE : $error');
      return 0;
    }
  }

  @override
  Future<List<RecordAudio>> getAllRecordingFromLocal() async {
    return await _database.getAllRecordingFromLocal();      
  }

  @override
  Future<bool> removeAudio(RecordAudio audio) async {
    try {
      int idRecording = await _database.removeAudio(audio);
      if(idRecording <= 0){
        throw Exception('Not removed recording');
      }      
      return true;
    } catch (error) {
      print('Error to removed from sqlite : $error');
      return false;
    }
  }
}
