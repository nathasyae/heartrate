import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:heartrate/models/CalendarDay.dart';
import 'package:http/http.dart' as http;

class CalendarScreen extends StatefulWidget {
  String uid;

  CalendarScreen({Key key, this.uid}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser user;

  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  List _selectedEvents;
  DateTime _selectedDay;

  CalendarDay CalendarDayFromJson(String str) => CalendarDay.fromJson(json.decode(str));

  String CalendarDayToJson(CalendarDay calendarLogs) => json.encode(calendarLogs.toJson());

  final Map<DateTime, List> template = {
  DateTime(2021, 3, 2): [
    {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '70'},
  ],
  DateTime(2021, 3, 6): [
    {'name': 'Arythmia', 'isDone': false, 'bpm': '155'},
  ],
  DateTime(2021, 3, 11): [
    {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '70'},
  ],
  DateTime(2021, 3, 12): [
    {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '71'},
    {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '72'},
  ],
  DateTime(2021, 3, 10): [
    {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '76'},
    {'name': 'Arythmia', 'isDone': false, 'bpm': '160'},
    {'name': 'Normal Sinus Rythm', 'isDone': true, 'bpm': '73'},
  ],
};

  dynamic getData() async {
    print("welcome to get data " + widget.uid);
    var response = await http.get(
        Uri.encodeFull("https://cardiwatch-core-frontendapi.azurewebsites.net/api/screening/calendar/?uid="+widget.uid),
        headers: {
          "Accept": "application/json"
        }
    );

    List<dynamic> fetchResult = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('RESJSON success');
    } else if (response.statusCode == 400){
      print('RESJSON ' + response.toString());
    } else {
      print('RESJSON fail ' +response.statusCode.toString());
      throw Exception('Failed to load');
    }

    return fetchResult;
  }

  Map<DateTime, List> content;

  Future<Map<DateTime, List>> prepareCalendar() async {

    Iterable l = await getData();
    List<CalendarDay> listCalendarDay = List<CalendarDay>.from(l.map((model)=> CalendarDay.fromJson(model)));

    Map<DateTime, List> newMap = {};

    for(var i = 0; i< listCalendarDay.length; i++) {
      newMap[listCalendarDay[i].date] = listCalendarDay[i].logsToList();
    }

    return newMap;

  }

  void setUpCalendar() async {

    Map<DateTime, List> newMap = await prepareCalendar();

    var now = DateTime.now();
    var lastMidnight = new DateTime(now.year, now.month, now.day);

    setState(() {
      _events = newMap;
      _selectedDay = lastMidnight;
      _selectedEvents = _events[_selectedDay] ?? [];
    });

  }

  Map<DateTime, List> _events;

  @override
  initState() {
    super.initState();
    setUpCalendar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_selectedEvents==null) ? Center(child: CircularProgressIndicator()) :
      SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(30),
              child: Calendar(
                startOnMonday: true,
                weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                events: _events,
                onRangeSelected: (range) =>
                    print("Range is ${range.from}, ${range.to}"),
                onDateSelected: (date) => _handleNewDate(date),
                isExpandable: true,
                eventDoneColor: Colors.green,
                selectedColor: Colors.red,
                todayColor: Colors.red,
                eventColor: Colors.orange,
                dayOfWeekStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 11),
              ),
            ),
            _buildEventList()
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0),
          child: Container(
            margin: EdgeInsets.fromLTRB(30,0,30,0),
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              children: [
                                Text(_selectedEvents[index]['name'].toString()),
                                // Text(DateFormat('yyyy-MM-dd').format(_selectedDay).toString(), style: TextStyle(fontSize: 14.0)),
                              ]),
                          SizedBox(width: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.favorite, size:10, color: Colors.red),
                                Text(_selectedEvents[index]['bpm'].toString(),
                                    style: TextStyle(fontSize: 24.0)),
                                Text(" BPM",
                                    style: TextStyle(fontSize: 16.0))
                              ]
                          ),
                        ]
                    )
                )
            ),
          ),

          // child: ListTile(
          //   title: Text(_selectedEvents[index]['name'].toString()),
          //   onTap: () {},

        // ),
        ),
        itemCount: _selectedEvents.length,
      ),
    );
  }

}
