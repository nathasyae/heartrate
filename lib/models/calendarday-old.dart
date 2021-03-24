// import 'dart:convert';
//
// import 'CalendarLog.dart';
//
// class CalendarDay{// isDone == isArythmia
//   DateTime date;
//   List<CalendarLog> calendarLogs;
//
//   CalendarDay({this.date, this.calendarLogs, calendarLogsReady});
//
//   factory CalendarDay.fromJson(Map<String, dynamic> json) {
//     // parsing the calendarLogs
//     // var list = json['calendarLogs'] as List;
//     // List<CalendarLog> calendarLogList = list.map((i) => CalendarLog.fromJson(i))  .toList();
//
//     // PARSE
//     // List<CalendarLog> listcalendarlogs = List<CalendarLog>.from(json["calendarLogs"].map((x) => CalendarLog.fromJson(x)));
//     // for(var i=0;i<listcalendarlogs.length;i++){
//     //   listcalendarlogs[i] = listcalendarlogs[i].toDict());
//     // }
//
//
//     return CalendarDay(
//       date: DateTime.parse(json['date']),
//       calendarLogs: List<CalendarLog>.from(json["calendarLogs"].map((x) => CalendarLog.fromJson(x))),
//       // calendarLogs: jsonDecode(json['calendarLogs']),
//       // calendarLogsReady: jsonDecode(json['']);,
//       // calendarLogsReady: List<CalendarLog>.from(json["calendarLogs"].map((x) => CalendarLog.fromJson(x))),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     // return {
//     //   'date': date,
//     //   'calendarLogs': calendarLogs,
//     //   );
//     // };
//   }
//
// }