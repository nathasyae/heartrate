import 'package:flutter/material.dart';
import 'package:heartrate/pages/auth/login.dart';
import 'package:heartrate/pages/calendarScreen.dart';
import 'package:heartrate/pages/profile.dart';
import 'package:heartrate/pages/workout/planSummary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   FirebaseUser user = await FirebaseAuth.instance.currentUser();
//   if(user != null){
//   // navigate to home page
//   }
//   else
//   {
// // log in
//   }

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
      routes: {
        // '/DailyRoutines': (context) => DailyRoutines(),

      }

      );
  }
}