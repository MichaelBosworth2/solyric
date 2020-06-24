import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/app/ui/record/util/HelperModel.dart';
import 'package:solyric_app/domain/interaction/RecordAudioUseCase.dart';
import 'package:solyric_app/domain/model/RecordAudio.dart';


class RecordAudioViewModel extends BaseViewModel {
  RecordAudioViewModel({@required RecordAudioUseCase useCase})
      : _useCase = useCase;

  final RecordAudioUseCase _useCase;
  bool _isRecording = false;
  RecordAudio currentAudio;

  List<RecordAudio> _audios = [];

  List<RecordAudio> get audios => _audios;

  RecordAudio get currentAudioSelected => currentAudio;

  bool get isRecording => _isRecording;

  selectAudioForListen(RecordAudio audio){
    currentAudio = audio;
    notifyListeners();
  }

  nextSelectAudioForListen(){
    int index = _audios.indexOf(currentAudio);
    if(currentAudio != null && index <= audios.length - 2){
      currentAudio = audios[index + 1];
      notifyListeners();
    }    
  }

  previousSelectAudioForListen(){
    int index = _audios.indexOf(currentAudio);
    if(currentAudio != null && index >= 1){
      currentAudio = audios[index - 1];
      notifyListeners();
    }    
  }

  setStateRecording(bool isRecording){
    _isRecording = isRecording;
    notifyListeners();
  }

  Future<bool> addAudio(RecordAudio audio) async { 
    setLoading(true);    
    int idRecording = await _useCase.addAudio(audio);

    RecordAudio _audio = converterToRecordAudio(audio, idRecording); 
    _audios.add(_audio);
    setLoading(false);
    notifyListeners();
    return idRecording > 0 ? true : false; 
  }

  Future<bool> removeAudio(RecordAudio audio) async { 
    setLoading(true);
    bool isDeleted = await _useCase.removeAudio(audio);
    if(isDeleted){
      _audios.remove(audio);
    }    
    setLoading(false);
    notifyListeners();
    return isDeleted;
  }

  Future initializeAudios() async { 
    setLoading(true);
    _audios = await _useCase.getAllRecordingFromLocal();
    setLoading(false);
    notifyListeners();    
  }
}
