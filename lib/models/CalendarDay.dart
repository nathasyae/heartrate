import 'dart:convert';

import 'CalendarLog.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CalendarDay.g.dart';

@JsonSerializable(explicitToJson: true)
class CalendarDay{// isDone == isArythmia
  DateTime date;
  List<CalendarLog> calendarLogs;

  CalendarDay({this.date, this.calendarLogs});

  factory CalendarDay.fromJson(Map<String, dynamic> json) => _$CalendarDayFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarDayToJson(this);

  Map<DateTime, List> toMap() {
    List calendarLogsList = calendarLogs.map((x) => x.toMap()).toList();

    return {
      date : calendarLogsList,
    };
  }

  List logsToList() {
    List calendarLogsList = calendarLogs.map((x) => x.toMap()).toList();

    return calendarLogsList;
  }

}