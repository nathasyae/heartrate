import 'package:json_annotation/json_annotation.dart';
part 'CalendarLog.g.dart';

@JsonSerializable(explicitToJson: true)
class CalendarLog{
  String id, name, bpm, timeOfDay;
  bool isDone, isRhythmNormal; // isDone == isArythmia
  DateTime dateTime;

  CalendarLog({this.id, this.name, this.bpm, this.timeOfDay, this.isDone, this.isRhythmNormal, this.dateTime});

  factory CalendarLog.fromJson(Map<String, dynamic> json) => _$CalendarLogFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarLogToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isDone': isDone,
      'bpm': bpm,
    };
  }

}