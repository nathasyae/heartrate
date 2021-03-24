// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CalendarDay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarDay _$CalendarDayFromJson(Map<String, dynamic> json) {
  return CalendarDay(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    calendarLogs: (json['calendarLogs'] as List)
        ?.map((e) =>
            e == null ? null : CalendarLog.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CalendarDayToJson(CalendarDay instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'calendarLogs': instance.calendarLogs?.map((e) => e?.toJson())?.toList(),
    };
