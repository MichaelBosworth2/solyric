// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Recording extends DataClass implements Insertable<Recording> {
  final String uri;
  final DateTime createdAt;
  final int id;
  final String recordingName;
  final String typeRecording;
  Recording(
      {@required this.uri,
      @required this.createdAt,
      @required this.id,
      @required this.recordingName,
      @required this.typeRecording});
  factory Recording.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return Recording(
      uri: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uri']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      recordingName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}recording_name']),
      typeRecording: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}type_recording']),
    );
  }
  factory Recording.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Recording(
      uri: serializer.fromJson<String>(json['uri']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      id: serializer.fromJson<int>(json['id']),
      recordingName: serializer.fromJson<String>(json['recordingName']),
      typeRecording: serializer.fromJson<String>(json['typeRecording']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uri': serializer.toJson<String>(uri),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'id': serializer.toJson<int>(id),
      'recordingName': serializer.toJson<String>(recordingName),
      'typeRecording': serializer.toJson<String>(typeRecording),
    };
  }

  @override
  RecordingsCompanion createCompanion(bool nullToAbsent) {
    return RecordingsCompanion(
      uri: uri == null && nullToAbsent ? const Value.absent() : Value(uri),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      recordingName: recordingName == null && nullToAbsent
          ? const Value.absent()
          : Value(recordingName),
      typeRecording: typeRecording == null && nullToAbsent
          ? const Value.absent()
          : Value(typeRecording),
    );
  }

  Recording copyWith(
          {String uri,
          DateTime createdAt,
          int id,
          String recordingName,
          String typeRecording}) =>
      Recording(
        uri: uri ?? this.uri,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        recordingName: recordingName ?? this.recordingName,
        typeRecording: typeRecording ?? this.typeRecording,
      );
  @override
  String toString() {
    return (StringBuffer('Recording(')
          ..write('uri: $uri, ')
          ..write('createdAt: $createdAt, ')
          ..write('id: $id, ')
          ..write('recordingName: $recordingName, ')
          ..write('typeRecording: $typeRecording')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      uri.hashCode,
      $mrjc(
          createdAt.hashCode,
          $mrjc(id.hashCode,
              $mrjc(recordingName.hashCode, typeRecording.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Recording &&
          other.uri == this.uri &&
          other.createdAt == this.createdAt &&
          other.id == this.id &&
          other.recordingName == this.recordingName &&
          other.typeRecording == this.typeRecording);
}

class RecordingsCompanion extends UpdateCompanion<Recording> {
  final Value<String> uri;
  final Value<DateTime> createdAt;
  final Value<int> id;
  final Value<String> recordingName;
  final Value<String> typeRecording;
  const RecordingsCompanion({
    this.uri = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.id = const Value.absent(),
    this.recordingName = const Value.absent(),
    this.typeRecording = const Value.absent(),
  });
  RecordingsCompanion.insert({
    @required String uri,
    @required DateTime createdAt,
    this.id = const Value.absent(),
    @required String recordingName,
    @required String typeRecording,
  })  : uri = Value(uri),
        createdAt = Value(createdAt),
        recordingName = Value(recordingName),
        typeRecording = Value(typeRecording);
  RecordingsCompanion copyWith(
      {Value<String> uri,
      Value<DateTime> createdAt,
      Value<int> id,
      Value<String> recordingName,
      Value<String> typeRecording}) {
    return RecordingsCompanion(
      uri: uri ?? this.uri,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      recordingName: recordingName ?? this.recordingName,
      typeRecording: typeRecording ?? this.typeRecording,
    );
  }
}

class $RecordingsTable extends Recordings
    with TableInfo<$RecordingsTable, Recording> {
  final GeneratedDatabase _db;
  final String _alias;
  $RecordingsTable(this._db, [this._alias]);
  final VerificationMeta _uriMeta = const VerificationMeta('uri');
  GeneratedTextColumn _uri;
  @override
  GeneratedTextColumn get uri => _uri ??= _constructUri();
  GeneratedTextColumn _constructUri() {
    return GeneratedTextColumn(
      'uri',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _recordingNameMeta =
      const VerificationMeta('recordingName');
  GeneratedTextColumn _recordingName;
  @override
  GeneratedTextColumn get recordingName =>
      _recordingName ??= _constructRecordingName();
  GeneratedTextColumn _constructRecordingName() {
    return GeneratedTextColumn(
      'recording_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeRecordingMeta =
      const VerificationMeta('typeRecording');
  GeneratedTextColumn _typeRecording;
  @override
  GeneratedTextColumn get typeRecording =>
      _typeRecording ??= _constructTypeRecording();
  GeneratedTextColumn _constructTypeRecording() {
    return GeneratedTextColumn(
      'type_recording',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [uri, createdAt, id, recordingName, typeRecording];
  @override
  $RecordingsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'recordings';
  @override
  final String actualTableName = 'recordings';
  @override
  VerificationContext validateIntegrity(RecordingsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.uri.present) {
      context.handle(_uriMeta, uri.isAcceptableValue(d.uri.value, _uriMeta));
    } else if (isInserting) {
      context.missing(_uriMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.recordingName.present) {
      context.handle(
          _recordingNameMeta,
          recordingName.isAcceptableValue(
              d.recordingName.value, _recordingNameMeta));
    } else if (isInserting) {
      context.missing(_recordingNameMeta);
    }
    if (d.typeRecording.present) {
      context.handle(
          _typeRecordingMeta,
          typeRecording.isAcceptableValue(
              d.typeRecording.value, _typeRecordingMeta));
    } else if (isInserting) {
      context.missing(_typeRecordingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recording map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Recording.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(RecordingsCompanion d) {
    final map = <String, Variable>{};
    if (d.uri.present) {
      map['uri'] = Variable<String, StringType>(d.uri.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.recordingName.present) {
      map['recording_name'] =
          Variable<String, StringType>(d.recordingName.value);
    }
    if (d.typeRecording.present) {
      map['type_recording'] =
          Variable<String, StringType>(d.typeRecording.value);
    }
    return map;
  }

  @override
  $RecordingsTable createAlias(String alias) {
    return $RecordingsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $RecordingsTable _recordings;
  $RecordingsTable get recordings => _recordings ??= $RecordingsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recordings];
}
