import 'package:flutter/material.dart';
import 'package:heartrate/pages/checkHeartRate.dart';
import 'package:heartrate/pages/register.dart';
import 'package:heartrate/pages/result.dart';
import 'package:flutter/material.dart';

import 'BottomNavPage.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPG',
      // theme: mainTheme,
      theme: ThemeData(
        backgroundColor: const Color(0xF4F4F4),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 24.0),
          bodyText1: TextStyle(fontSize: 18.0),
          bodyText2: TextStyle(fontSize: 16.0),
        ),
      ),
      // home: HomePage(),
      // home: Register(),
      home: Register(),
      // home: Result(),
    );
  }
}