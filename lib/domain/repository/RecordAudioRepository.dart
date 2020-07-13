import 'package:solyric_app/domain/model/RecordAudio.dart';

class RecordAudioRepository {
  
  Future<int> addAudio(RecordAudio audio) {
    throw Exception("Unimplemented exception");
  }

  Future<bool> removeAudio(RecordAudio audio) {
    throw Exception("Unimplemented exception");
  }
    
  Future<List<RecordAudio>> getAllRecordingFromLocal() {
    throw Exception("Unimplemented exception");
  }
  

  /*Future<bool> login(RecordAudio audio) {
    throw Exception("Unimplemented exception");
  }

  Future<bool> resetPassword(String email) async {
    throw Exception("Unimplemented exception");
  }

  Future<AuthStatus> signUp(RecordAudio audio) async {
    throw Exception("Unimplemented exception");
  }

  Future<AuthStatus> createUsername(String username, String uid) async {
    throw Exception("Unimplemented exception");
  }

  Future<AuthStatus> isExistUsername(String username) async {
    throw Exception("Unimplemented exception");
  }*/
}