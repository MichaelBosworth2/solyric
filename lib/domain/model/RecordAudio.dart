import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/record/util/TypeRecordingEmum.dart';

class RecordAudio {
  const RecordAudio({this.id, @required this.uri, @required this.name,  @required this.typeRecording, @required this.createdAt});

  final int id;
  final String uri;
  final String name;
  final TypeRecording typeRecording;
  final DateTime createdAt;
}
