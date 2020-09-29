import 'dart:async';
import 'package:solyric_app/app/ui/record/util/HelperModel.dart';
import 'package:solyric_app/data/database/database.dart';
import 'package:solyric_app/domain/model/RecordAudio.dart';

class SolyricDatabaseLocal {  

  Future<int> addAudio(RecordAudio audio) async{
    return await AppDatabase().insertNewRecording(converterRecordingDBFromRecordAudio(audio));    
  }

  Future<int> removeAudio(RecordAudio audio) async{
    return await AppDatabase().deleteRecording(converterRecordingDBFromRecordAudio(audio));
  }

  Future<List<RecordAudio>> getAllRecordingFromLocal() async{
    List<RecordAudio> listFormatted = [];
    List<Recording> listRecording = await AppDatabase().getAllRecording();
    
    // Formatted recording from local database to RecordAudio Model.
    listRecording.forEach((audio) {
      listFormatted.add(converterRecordAudioFromRecordingDB(audio));
    });
    return listFormatted;
  }
}
