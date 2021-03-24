
// final Map<DateTime, List> _events = {
//   DateTime(2021, 3, 2): [
//     {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '70'},
//   ],
//   DateTime(2021, 3, 6): [
//     {'name': 'Arythmia', 'isDone': false, 'bpm': '155'},
//   ],
//   DateTime(2021, 3, 11): [
//     {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '70'},
//   ],
//   DateTime(2021, 3, 12): [
//     {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '71'},
//     {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '72'},
//   ],
//   DateTime(2021, 3, 10): [
//     {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '76'},
//     {'name': 'Arythmia', 'isDone': false, 'bpm': '160'},
//     {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '73'},
//   ],
// };








// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import 'dart:convert';
//
// CalendarDay CalendarDayFromJson(String str) => CalendarDay.fromJson(json.decode(str));
//
// String CalendarDayToJson(CalendarDay calendarLogs) => json.encode(calendarLogs.toJson());
//
// class CalendarDay {
//   String error;
//   String message;
//   List<CalendarLog> calendarLogs;
//
//   CalendarDay({
//     this.error,
//     this.message,
//     this.calendarLogs,
//   });
//
//   factory CalendarDay.fromJson(Map<String, dynamic> json) => CalendarDay(
//     error: json["error"],
//     message: json["message"],
//     calendarLogs: List<CalendarLog>.from(json["calendarLogs"].map((x) => CalendarLog.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "error": error,
//     "message": message,
//     "calendarLogs": List<dynamic>.from(calendarLogs.map((x) => x.toJson())),
//   };
// }
//
// class CalendarLog {
//   bool status;
//   String id;
//   String groupId;
//   DateTime date;
//   String title;
//   int priority;
//   String description;
//   List<dynamic> tasks;
//   DateTime createdDate;
//   int v;
//
//   CalendarLog({
//     this.status,
//     this.id,
//     this.groupId,
//     this.date,
//     this.title,
//     this.priority,
//     this.description,
//     this.tasks,
//     this.createdDate,
//     this.v,
//   });
//
//   factory CalendarLog.fromJson(Map<String, dynamic> json) => CalendarLog(
//     status: json["status"],
//     id: json["_id"],
//     groupId: json["group_id"],
//     date: DateTime.parse(json["date"]),
//     title: json["title"],
//     priority: json["priority"],
//     description: json["description"],
//     tasks: List<dynamic>.from(json["tasks"].map((x) => x)),
//     createdDate: DateTime.parse(json["created_date"]),
//     v: json["__v"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "_id": id,
//     "group_id": groupId,
//     "date": date.toIso8601String(),
//     "title": title,
//     "priority": priority,
//     "description": description,
//     "tasks": List<dynamic>.from(tasks.map((x) => x)),
//     "created_date": createdDate.toIso8601String(),
//     "__v": v,
//   };
// }
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemecalendarLogs(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   List _selectedCalendarDays;
//   int _counter = 0;
//   Map<DateTime, List> _CalendarDays;
//   CalendarController _calendarController;
//   AnimationController _animationController;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   Future<Map<DateTime, List>> getTask() async {
//     Map<DateTime, List> mapFetch = {};
//
//     await Future.delayed(const Duration(seconds: 3), () {});
//
//     /*String link = baseURL + fetchTodoByDate;
//     var res = await http.post(Uri.encodeFull(link), headers: {"Accept": "application/json"});
//     if (res.statusCode == 200) {
//       // need help in creating fetch logic here
//     }*/
//
//     String responseString = '''
//     {
//     "error": "0",
//     "message": "Got it!",
//     "calendarLogs": [
//         {
//             "status": false,
//             "_id": "5e04a27692928701258b9b06",
//             "group_id": "5df8aaae2f85481f6e31db59",
//             "date": "2019-12-29T00:00:00.000Z",
//             "title": "new task",
//             "priority": 5,
//             "description": "just a description",
//             "tasks": [],
//             "created_date": "2019-12-26T12:07:18.301Z",
//             "__v": 0
//         },
//         {
//             "status": false,
//             "_id": "5e04a27692928701258b9b06",
//             "group_id": "5df8aaae2f85481f6e31db59",
//             "date": "2019-12-30T00:00:00.000Z",
//             "title": "abc",
//             "priority": 5,
//             "description": "just a description",
//             "tasks": [],
//             "created_date": "2019-12-26T12:07:18.301Z",
//             "__v": 0
//         }
//     ]
// }
//     ''';
//
//     CalendarDay CalendarDay = CalendarDayFromJson(responseString);
//
//     for (int i = 0; i < CalendarDay.calendarLogs.length; i++) {
//       mapFetch[CalendarDay.calendarLogs[i].date] = [CalendarDay.calendarLogs[i].title];
//     }
//
//     return mapFetch;
//   }
//
//   void _onDaySelected(DateTime day, List CalendarDays) {
//     print('CALLBACK: _onDaySelected');
//     setState(() {
//       _selectedCalendarDays = CalendarDays;
//     });
//   }
//
//   @override
//   void initState() {
//     final _selectedDay = DateTime.now();
//     _selectedCalendarDays = [];
//     _calendarController = CalendarController();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     );
//
//     _animationController.forward();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       getTask().then((val) => setState(() {
//         _CalendarDays = val;
//       }));
//       //print( ' ${_CalendarDays.toString()} ');
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _calendarController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _buildTableCalendarWithBuilders(),
//             const SizedBox(height: 8.0),
//             const SizedBox(height: 8.0),
//             Expanded(child: _buildCalendarDayList()),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//   Widget _buildTableCalendarWithBuilders() {
//     return TableCalendar(
//       //locale: 'pl_PL',
//       calendarController: _calendarController,
//       CalendarDays: _CalendarDays,
//       //holidays: _holidays,
//       initialCalendarFormat: CalendarFormat.month,
//       formatAnimation: FormatAnimation.slide,
//       startingDayOfWeek: StartingDayOfWeek.sunday,
//       availableGestures: AvailableGestures.all,
//       availableCalendarFormats: const {
//         CalendarFormat.month: '',
//         CalendarFormat.week: '',
//       },
//       calendarStyle: CalendarStyle(
//         outsideDaysVisible: false,
//         weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
//         holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
//       ),
//       daysOfWeekStyle: DaysOfWeekStyle(
//         weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
//       ),
//       headerStyle: HeaderStyle(
//         centerHeaderTitle: true,
//         formatButtonVisible: false,
//       ),
//       builders: CalendarBuilders(
//         selectedDayBuilder: (context, date, _) {
//           return FadeTransition(
//             opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
//             child: Container(
//               margin: const EdgeInsets.all(4.0),
//               padding: const EdgeInsets.only(top: 5.0, left: 6.0),
//               color: Colors.deepOrange[300],
//               width: 100,
//               height: 100,
//               child: Text(
//                 '${date.day}',
//                 style: TextStyle().copyWith(fontSize: 16.0),
//               ),
//             ),
//           );
//         },
//         todayDayBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4.0),
//             padding: const EdgeInsets.only(top: 5.0, left: 6.0),
//             color: Colors.amber[400],
//             width: 100,
//             height: 100,
//             child: Text(
//               '${date.day}',
//               style: TextStyle().copyWith(fontSize: 16.0),
//             ),
//           );
//         },
//         markersBuilder: (context, date, CalendarDays, holidays) {
//           final children = <Widget>[];
//
//           if (CalendarDays.isNotEmpty) {
//             children.add(
//               Positioned(
//                 right: 1,
//                 bottom: 1,
//                 child: _buildCalendarDaysMarker(date, CalendarDays),
//               ),
//             );
//           }
//
//           if (holidays.isNotEmpty) {
//             children.add(
//               Positioned(
//                 right: -2,
//                 top: -2,
//                 child: _buildHolidaysMarker(),
//               ),
//             );
//           }
//
//           return children;
//         },
//       ),
//       onDaySelected: (date, CalendarDays) {
//         _onDaySelected(date, CalendarDays);
//         _animationController.forward(from: 0.0);
//       },
//       onVisibleDaysChanged: _onVisibleDaysChanged,
//     );
//   }
//
//   void _onVisibleDaysChanged(
//       DateTime first, DateTime last, CalendarFormat format) {
//     print('CALLBACK: _onVisibleDaysChanged');
//   }
//
//   Widget _buildCalendarDaysMarker(DateTime date, List CalendarDays) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         color: _calendarController.isSelected(date)
//             ? Colors.brown[500]
//             : _calendarController.isToday(date)
//             ? Colors.brown[300]
//             : Colors.blue[400],
//       ),
//       width: 16.0,
//       height: 16.0,
//       child: Center(
//         child: Text(
//           '${CalendarDays.length}',
//           style: TextStyle().copyWith(
//             color: Colors.white,
//             fontSize: 12.0,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHolidaysMarker() {
//     return Icon(
//       Icons.add_box,
//       size: 20.0,
//       color: Colors.blueGrey[800],
//     );
//   }
//
//   Widget _buildCalendarDayList() {
//     return ListView(
//       children: _selectedCalendarDays
//           .map((CalendarDay) => Container(
//         decoration: BoxDecoration(
//           border: Border.all(width: 0.8),
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         margin:
//         const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//         child: ListTile(
//           title: Text(CalendarDay.toString()),
//           onTap: () => print('$CalendarDay tapped!'),
//         ),
//       ))
//           .toList(),
//     );
//   }
// }