import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/components/button.dart';
import 'package:wakelock/wakelock.dart';
// import 'chart.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heartrate/style.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  @override
  ResultView createState() {
    return ResultView();
  }
}

class ResultView extends State<Result> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Result",
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 50),
                  Text("Avg Heart Rate",
                      style: Theme.of(context).textTheme.headline2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, size:50, color: Colors.red,),
                      Text("72",
                          style: TextStyle(fontSize: 50.0)),
                      Text(" BPM",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                  Text("Normal heart rate",
                      style: Theme.of(context).textTheme.bodyText1),

                  SizedBox(height: 50),
                  Text("Rythm Analysis",
                      style: Theme.of(context).textTheme.headline2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.stacked_line_chart, size:50, color: Colors.red),
                      // Container(
                      //   child: Image(
                      //     image: AssetImage(
                      //       'assets/heartbeat.png',
                      //     ),
                      //     fit: BoxFit.cover,
                      //   ),
                      //   height: 24,
                      //   width: 24,
                      // ),
                      Text("Normal",
                          style: TextStyle(fontSize: 40.0)),
                    ],
                  ),
                  SizedBox(height: 80),
                  // Button(title: "See Advice", onPressed: doNothing(), isPrimary: true),
                  FlatButton(
                    minWidth: 250,
                    color: Colors.red,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(10.0),
                    splashColor: secondaryRed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.red)
                    ),
                    onPressed: () {},
                    child: Text(
                      "See Advice",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  FlatButton(
                    minWidth: 250,
                    color: Theme.of(context).backgroundColor,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(10.0),
                    splashColor: secondaryRed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.black)
                    ),
                    onPressed: () {},
                    child: Text(
                      "See Full Report",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  // Button(title: "See Full Report", onPressed: doNothing(), isPrimary: false)
                ]
            )
        )
    );
  }

  doNothing(){}

}