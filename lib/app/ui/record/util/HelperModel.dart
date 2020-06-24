import 'package:solyric_app/database/database.dart';
import 'package:solyric_app/domain/model/RecordAudio.dart';

RecordAudio converterToRecordAudio(RecordAudio audio, int idRecording){
  return RecordAudio(
      id: idRecording > 0 ? idRecording : -1,
      createdAt: audio.createdAt,
      name: audio.name,
      typeRecording: audio.typeRecording,
      uri: audio.uri
    );
}

Recording converterRecordingDBFromRecordAudio(RecordAudio audio){
  return Recording(
      id: audio.id,
      recordingName: audio.name,
      createdAt: audio.createdAt,
      uri: audio.uri,
      typeRecording: audio.typeRecording == 'guitar' ? 'guitar' : 'piano'
    );
}

RecordAudio converterRecordAudioFromRecordingDB(Recording audio){
  return RecordAudio(
      id: audio.id,
      name: audio.recordingName,
      createdAt: audio.createdAt,
      uri: audio.uri,
      typeRecording: audio.typeRecording == 'guitar' ? 'guitar' : 'piano'
    );
}