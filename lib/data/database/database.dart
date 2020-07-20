import 'package:moor_flutter/moor_flutter.dart';
part 'database.g.dart';

class Recordings extends Table {
  TextColumn get uri => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get recordingName => text()();
  TextColumn get typeRecording => text()();
}

@UseMoor(tables: [Recordings])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", logStatements: true));
  int get schemaVersion => 1;
  Future<List<Recording>> getAllRecording() => select(recordings).get();
  Stream<List<Recording>> watchAllRecording() => select(recordings).watch();
  Future insertNewRecording(Recording recording) => into(recordings).insert(recording);
  Future deleteRecording(Recording recording) => delete(recordings).delete(recording);
}