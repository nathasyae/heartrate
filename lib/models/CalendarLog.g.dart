// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CalendarLog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarLog _$CalendarLogFromJson(Map<String, dynamic> json) {
  return CalendarLog(
    id: json['id'] as String,
    name: json['name'] as String,
    bpm: json['bpm'] as String,
    timeOfDay: json['timeOfDay'] as String,
    isDone: json['isDone'] as bool,
    isRhythmNormal: json['isRhythmNormal'] as bool,
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
  );
}

Map<String, dynamic> _$CalendarLogToJson(CalendarLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bpm': instance.bpm,
      'timeOfDay': instance.timeOfDay,
      'isDone': instance.isDone,
      'isRhythmNormal': instance.isRhythmNormal,
      'dateTime': instance.dateTime?.toIso8601String(),
    };
