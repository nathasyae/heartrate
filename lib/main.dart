import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/calendarScreen.dart';
import 'package:heartrate/pages/chat/layout_chat.dart';
import 'package:heartrate/pages/checkHeartRate.dart';
import 'package:heartrate/pages/consultation.dart';
import 'package:heartrate/pages/dailyroutines.dart';
import 'package:heartrate/pages/forms/cvdHistory.dart';
import 'package:heartrate/pages/forms/healthHistory.dart';
import 'package:heartrate/pages/forms/activityLevel.dart';
import 'package:heartrate/pages/forms/personalInfo.dart';
import 'file:///C:/Users/tasya/Desktop/heartrate/lib/pages/auth/login.dart';
import 'package:heartrate/pages/measuring.dart';
import 'package:heartrate/pages/programs.dart';
import 'file:///C:/Users/tasya/Desktop/heartrate/lib/pages/auth/register.dart';
import 'package:heartrate/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/resultProVersion.dart';
import 'package:heartrate/pages/symptomps.dart';

import 'BottomNavPage.dart';
import 'homePage.dart';
import 'models/User.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/dailyroutines.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CardiWatch',

      theme: ThemeData(
        backgroundColor: const Color(0xF4F4F4),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 24.0),
          bodyText1: TextStyle(fontSize: 18.0),
          bodyText2: TextStyle(fontSize: 16.0),
        ),

        primaryColor: Colors.red,
        buttonColor: Colors.red,

        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 16),
            backgroundColor: Colors.white,
        ),

      ),
      home: Login(),
      // home: ResultProVersion(),

      routes: {
        // '/DailyRoutines': (context) => DailyRoutines(),

      }

      );
  }
}