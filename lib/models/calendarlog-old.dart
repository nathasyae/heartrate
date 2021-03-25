// import 'package:json_annotation/json_annotation.dart';
// part 'CalendarLog.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class CalendarLog{
//   String id, name, bpm, timeOfDay;
//   bool isDone, isRhythmNormal; // isDone == isArythmia
//   DateTime dateTime;
//
//   CalendarLog({this.id, this.name, this.bpm, this.timeOfDay, this.isDone, this.isRhythmNormal, this.dateTime});
//
//   factory CalendarLog.fromJson(Map<String, dynamic> json) {
//     return CalendarLog(
//       id: json['id'],
//       name: json['name'],
//       bpm: json['bpm'],
//       timeOfDay: json['timeOfDay'],
//       isDone: json['isDone'] as bool,
//       isRhythmNormal: json['isRhythmNormal'] as bool,
//       dateTime: DateTime.parse(json['dateTime']),
//     );
//   }
//
//   fromJsontoDict(Map<String, dynamic> json){
//     return {
//       'name': json['name'],
//       'isDone': json['isDone'],
//       'bpm': ['bpm'],
//     };
//   }
//
//
//   Map<String, dynamic> toDict(){
//     return {
//       'name': name,
//       'isDone': isDone,
//       'bpm': bpm
//     };
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'bpm': bpm,
//       'timeOfDay': timeOfDay,
//       'isDone': isDone,
//       'isRhythmNormal': isRhythmNormal,
//       'dateTime': dateTime
//     };
//   }
//
// }