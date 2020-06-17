import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/record/viewmodel/RecordAudioViewModel.dart';
import 'package:solyric_app/domain/model/RecordAudio.dart';
import 'package:solyric_app/app/utils/Duration.dart';
import 'package:solyric_app/app/ui/record/util/TypeRecordingEmum.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class RecordCard extends StatefulWidget{
  @override
  RecordCardState createState() => RecordCardState();
}

class RecordCardState extends  State<RecordCard> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isComplete = false;
  bool isPlayingRecording = false;
  String recordFilePath;
  String statusText = "";
  // Change this when it will integrate with API and We generate an UID per each audio
  int uidAudio = 0;


  final _controllerInputNameRecording = TextEditingController();
  // Counter changes every seconds, It is used for cronometer when the recording is in progress.
  int _counter = 0;

  // We set max seconds allow to record audio
  int _maxSecondsAllowRecorder = 30; 

  Timer _timer;
  TypeRecording _typeRecording;

  @override
  void initState() {
    setState(() {
      _typeRecording = TypeRecording.guitar;
    });
    super.initState();
    listenerAudioPlayer();
  }

  // When the audio finishes playing
  void listenerAudioPlayer(){
    audioPlayer.onPlayerCompletion.listen((event) {
      stopPlayer();
    });
  }  

  void _startTimer(RecordAudioViewModel model){
    if(_timer != null){
      _timer.cancel();
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        if(_counter == _maxSecondsAllowRecorder){
          stopRecord(model);
          showModalSaveRecord(model);
        }else{
          _counter++;
        }
      });
    });
  }

  void _stopTimer(){
    if(_timer != null){
      _timer.cancel();
    }

    setState(() {
      _counter = 0;
    });
  }

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord(RecordAudioViewModel model) async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      // Stop play when start a new recording
      if(isPlayingRecording){
        stopPlayer();
      }

      // Changed state to recording to IN-PROGRESS
      model.setStateRecording(true);
      statusText = "Recording...";

      _startTimer(model);
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
      print('error permission : $statusText');
    }
    setState(() {});
  }

  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }

  void stopRecord(RecordAudioViewModel model) {
    bool s = RecordMp3.instance.stop();
    if (s) {
      // Changed state to recording to STOP OR COMPLETE RECORDING
      model.setStateRecording(false);
      statusText = "Record complete";
      isComplete = true;
      _stopTimer();
      setState(() {
        // Reset to guitar type after of save
         _typeRecording = TypeRecording.guitar;
      });      
    }
  }

  void saveRecorder(model){
     if (recordFilePath != null && File(recordFilePath).existsSync()) {
        model.addAudio(RecordAudio(
            name: _controllerInputNameRecording.text.length == 0 
              ? Resources.RECORDING_PREFIX_NO_NAME + DateFormat.yMMMd().format(new DateTime.now()) 
              : _controllerInputNameRecording.text, 
            uri: recordFilePath,
            typeRecording: _typeRecording,
            createdAt: DateTime.now() 
          )
        );        
      }
      setState(() {
        // Reset to guitar type after of save
         _typeRecording = TypeRecording.guitar;
      });
  }

  // In future we could use this method

  /*void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      if (recordFilePath != null && File(recordFilePath).existsSync()) {
        print(recordFilePath.runtimeType);
      }
      setState(() {});
    }
  }*/

  void play(RecordAudioViewModel model) {
    var currentAudioSelect = model.currentAudio;
    if (currentAudioSelect.uri != null && File(currentAudioSelect.uri).existsSync()) {
      audioPlayer.play(currentAudioSelect.uri, isLocal: true);
      setState(() {
        isPlayingRecording = true;
      });
    }
  }

  void stopPlayer(){
    audioPlayer.stop();
    setState(() {
      isPlayingRecording = false;
    });
  }

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${uidAudio++}.mp3";
  }

  showModalSaveRecord(RecordAudioViewModel model){
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 20,
      isScrollControlled: true,
      builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 390,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(Resources.RECORDING_DETAIL, 
                          style: TextStyle(
                            color: Theme.of(context).accentColor, 
                            fontSize: 18, 
                            height: 1.5,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      UIHelper.verticalSpace(15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: _controllerInputNameRecording,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: Resources.ENTER_RECORDING_NAME
                          ),
                        )
                      ),
                      const Divider(
                        color: Colors.black45,
                        height: 2
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: const Text(Resources.RECORDING_TYPE, 
                          style: TextStyle(color: Colors.black54, fontSize: 16, height: 1.5),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          RadioListTile<TypeRecording>(
                            title: const Text(Resources.GUITAR_TITLE),
                            value: TypeRecording.guitar,
                            groupValue: _typeRecording,
                            onChanged: (TypeRecording value) {
                              setState(() {
                                _typeRecording = value;
                              });
                            },
                          ),
                          RadioListTile<TypeRecording>(
                            title: const Text(Resources.PIANO_TITLE),
                            value: TypeRecording.piano,
                            groupValue: _typeRecording,
                            onChanged: (TypeRecording value) {
                              setState(() {
                                _typeRecording = value;
                              });
                            },
                          ),                                                      
                        ],
                      ),
                      const Divider(
                        color: Colors.black45,
                        height: 2
                      ),
                      UIHelper.verticalSpace(15),
                      InkWell(
                        child: const Text(Resources.RECORDING_SAVE,
                          style: TextStyle(
                            color: Colors.green, 
                            fontSize: 18, 
                            fontWeight: FontWeight.bold,
                            height: 1.5
                          )
                        ),
                        onTap: (){ 
                          Navigator.pop(context);
                          saveRecorder(model);
                        },
                      ),
                      UIHelper.verticalSpace(15),
                      const Divider(
                        color: Colors.black45,
                        height: 2
                      ),
                      UIHelper.verticalSpace(15),
                      InkWell(
                        child:  const Text(Resources.RECORDING_CANCEL,
                          style: TextStyle(
                            color: Colors.black, 
                            fontSize: 18, 
                            fontWeight: FontWeight.bold,
                            height: 1.5
                          )
                        ),
                        onTap: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              );   
        });
      }                              
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<RecordAudioViewModel>(
      builder: (context, model, child) => Container(
        height: 250,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Resources.BACKGROUND_RECORD),
                  fit: BoxFit.cover                
                ),
              ),
              child: 
                Center(
                  child: 
                    InkWell(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.red,// set border color
                              width: 18.0),   // set border width
                          borderRadius: BorderRadius.all(
                              Radius.circular(80.0)), // set rounded corner radius
                          boxShadow: [BoxShadow(blurRadius: 15,color: Colors.red.shade500, offset: Offset(0,0))]
                        ),
                        child: 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: 
                              <Widget>[
                                RecordMp3.instance.status == RecordStatus.RECORDING 
                                ? Icon(Icons.stop, size: 40, color: Theme.of(context).primaryColor)
                                : SvgPicture.asset(Resources.IC_MIC ,color: Theme.of(context).primaryColor, width: 30),
                                RecordMp3.instance.status != RecordStatus.RECORDING  ? SizedBox(height: 9) : Container(),
                                Text( RecordMp3.instance.status != RecordStatus.RECORDING ? Resources.TAP_TO_RECORD.toUpperCase() : formatDuration(Duration(seconds: _counter)), 
                                  style: TextStyle(
                                    fontSize: RecordMp3.instance.status != RecordStatus.RECORDING ? 8.5 : 10, 
                                    color: RecordMp3.instance.status != RecordStatus.RECORDING ? Colors.black54 : Colors.red, 
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                            ],
                        ),
                      ),
                      onTap: () {
                        if(RecordMp3.instance.status == RecordStatus.IDEL){
                          startRecord(model);
                        }else{
                          stopRecord(model);
                          _stopTimer();
                          showModalSaveRecord(model);
                        }
                      },
                      ),
                )
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: 
                Container(
                  child: 
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(              
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                border: Border.all(
                                    color: Colors.white,// set border color
                                    width: 3.0
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(80.0)), // set rounded corner radius
                              ),
                            child: SvgPicture.asset(Resources.IC_PREVIOUS , width: 20, color: Colors.white,)
                          ),
                          onTap: () {
                            if(!model.isRecording){
                              stopPlayer();
                              model.previousSelectAudioForListen();
                              play(model);
                            }
                          },
                        ),
                        UIHelper.horizontalSpace(20),
                        InkWell(              
                          child: Container(
                            height: 65.0,
                            width: 65.0,
                            padding: !isPlayingRecording ? EdgeInsets.all(18) : null,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                border: Border.all(
                                    color: Colors.white,// set border color
                                    width: 3.0
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(80.0)), // set rounded corner radius
                              ),
                            child: !model.isRecording && isPlayingRecording
                                ? Icon(Icons.stop, size: 40, color: Colors.white)
                                : SvgPicture.asset(Resources.IC_PLAY, color: Colors.white),
                          ),
                          onTap: () {
                            if(!model.isRecording){
                              if(isPlayingRecording){
                                stopPlayer();
                              }else{
                                play(model);
                              }
                            }
                          },
                        ),
                        UIHelper.horizontalSpace(20),
                        InkWell(              
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                border: Border.all(
                                    color: Colors.white,// set border color
                                    width: 3.0
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(100.0)), // set rounded corner radius
                              ),
                            child: SvgPicture.asset(Resources.IC_NEXT , width: 10)
                          ),
                          onTap: () {
                            if(!model.isRecording){
                              stopPlayer();
                              model.nextSelectAudioForListen();
                              play(model);
                            }                            
                          },
                        )
                    ],)
              )     
            )
        ])
      )
    );
  }
}
