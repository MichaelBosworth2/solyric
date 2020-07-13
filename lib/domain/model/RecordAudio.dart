import 'package:flutter/material.dart';

class RecordAudio {
  const RecordAudio({this.id, @required this.uri, @required this.name,  @required this.typeRecording, @required this.createdAt});

  final int id;
  final String uri;
  final String name;
  final String typeRecording;
  final DateTime createdAt;
}
